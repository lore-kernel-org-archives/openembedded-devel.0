Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OndUT-0001MB-2v
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 22:19:45 +0200
Received: by gya6 with SMTP id 6so2404818gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 13:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=69IoRuA28ovez4DBbGhZMHS19lyhRNxsEA+Q23emF2c=;
	b=rCUTWMM019Mf+5+lSbAD+vneFvE2hZEZdyvvdq9ZdpbZHj9YAt7zvP0w9ds23AwbYP
	dfdoerk8Vu5LYtd+0Y87makjT7sg6o1xFz5JyJU8rAPEWZ0uY/73LaP8tRpbbGMxqKRY
	g+FPXPDzdDRZMr8mIqa/4QGI7ltUzAc1fH+8I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=eUfBEsdXDAUbEBroHXqSNkTN6dKZ2Bw7BrdgfYU3uwfhXG50yTzyzO3ld09BS/1Igk
	jeemc8hFO1Jd46QdCYRTRxdcQgcLKKwqnaJoVUvXtPKzOTxsk+FxEpav2tb/nyqZnJnP
	2665Y8ChDI89DTZCbkOdAFHdbh+EuRBy8qBZU=
MIME-Version: 1.0
Received: by 10.151.59.20 with SMTP id m20mr5903531ybk.88.1282594742622; Mon,
	23 Aug 2010 13:19:02 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 23 Aug 2010 13:19:02 -0700 (PDT)
Date: Mon, 23 Aug 2010 22:19:02 +0200
Message-ID: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: script to remove orphaned files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Aug 2010 20:19:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

As I indicated before there are quite some orphaned patch files that
are not used in any recipe.

To resolve this I've written a small bash script to remove unused
patches/files from a directory.
Below is a copy of the script.
This is posted to get feedback on the script (with the review comments
added this can probably be put in the contrib dir).
If the script is considered to be good, we can run it on the
directories that we have to clean them up.
My preference is that recipe owners do this, but as a lot of dirs are
orphaned, I am planning to do this myself in due time (after the
review and after giving recipe owners a chance to do it themselves).

Attached is the script. It takes a recipe dir as argument (e.g. recipes/gcc)
It searches for all .patch and .diff files in that dir, and checks if
they are mentioned in a .bb file or .inc file
if the file is there, nothing is done.
If the fileis not there and there is a -d argument before the dir
name, the files are actually removed and the change committed.
Otherwise this filename is just listed.

Proposal is to start with a 1 week script review period.

Frans.

The script:

#!/bin/bash
# clean-recipe: a small shell script to clean unneeded patch/diff
files from a recipe folder
if [ $# -eq 0 ]
then
    echo "usage " $0 "[-d] recipe-dir-name"
    exit
fi
delete=0
if [ $1 = "-d" ]
then
    delete=1
    shift;
fi
dir=$1
if [ ! -d $dir ]
then
    echo $dir " is not a directory"
    exit
fi
cd $dir
removed=0
find -name "*.diff" -o -name "*.patch" | (while  read name
    do
        bname=`basename $name`
        grep -q $bname *.bb *.inc || \
        if [ $delete -eq 0 ]
        then
        echo $name " is unused"
        else
        git rm $name
        removed=1
        fi
    done
    if [ $removed -eq 1 ]
    then
        echo $dir ": removed unneeded files" | git commit -s -F -
    fi )



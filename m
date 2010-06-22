Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OQxak-0008S6-De
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 09:08:22 +0200
Received: by bwz14 with SMTP id 14so1452968bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 00:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=M9lLVHsuIg6G07x9BP4hJNPDJBrWcNjhVuxYsAMwT8M=;
	b=op3HUPZksDpOHcLgQnC16rmUOAbVNL8BHU0eqrBsoxIpqfTBGVtt2Hn0ne4StWxSEB
	SxOV9WT1jn5k9RvLX31nrQB4duhYt1Vyyu0s994Ovz0YLWjDXCnsjfDmW7lLKla3UHn+
	GjMKbrYUPgqEQyahxaKfNG4DnCyf1Ytg7CEow=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=cN6YQDoGcL1WySKDIQEjk/SPZ42coWjJ3zQHT1ggfHRjPypMWwHbOpn1HNvlA63KE/
	d0NlvCg3rbkGcQutiHMoZ4Rqy2sk8yBjvpRktranB2hbBzI3hdNzK2a22GE56PWvynG6
	Ra/bjZkRSMWD6hKS7wG8k/2nQvHSc82YiaHps=
MIME-Version: 1.0
Received: by 10.204.47.34 with SMTP id l34mr3815515bkf.77.1277190223859; Tue, 
	22 Jun 2010 00:03:43 -0700 (PDT)
Received: by 10.204.77.132 with HTTP; Tue, 22 Jun 2010 00:03:43 -0700 (PDT)
Date: Tue, 22 Jun 2010 09:03:43 +0200
Message-ID: <AANLkTim2-Y4qW9Wb-kycxo89vNZgBJkdeVSyERXZYCoJ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] patch file location
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
X-List-Received-Date: Tue, 22 Jun 2010 07:08:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'd like to draw the attention to the location of patch files.
My original understanding was that these should be in either the files
dir (if they apply to all), or in a dir with the name of the recipe
(replacing the _ with a - ).
And I kind-a assumed that if a patch is in a recipe dir it would have
priority above a version in the files dir.

However, this does not seem to be enforced.
I noticed some packages do also not live up to this.
One example is glibc.
Take one patch as example: arm-memcpy.patch:

This patch occurs in 5 dirs:

recipes/glibc$ ls -l */arm-memcpy*
-rw-r--r-- 1 frans frans 17071 2010-06-02 15:57 glibc-2.2.5/arm-memcpy.patch
-rw-r--r-- 1 frans frans 16957 2010-06-02 15:57 glibc-2.3.2/arm-memcpy.patch
-rw-r--r-- 1 frans frans 16960 2010-06-02 15:57 glibc-2.4/arm-memcpy.patch
-rw-r--r-- 1 frans frans 16993 2010-06-02 15:57 glibc-cvs-2.3.5/arm-memcpy.patch
-rw-r--r-- 1 frans frans 16960 2010-06-02 15:57 glibc-cvs/arm-memcpy.patch

Looking at the size these are at least 4 different versions

This patch is referenced in 14 recipes:

recipes/glibc$ grep arm-memcpy *
glibc_2.10.1.bb:           file://arm-memcpy.patch \
glibc_2.2.5.bb:	   file://arm-memcpy.patch;striplevel=0 \
glibc_2.3.2.bb: 	   file://arm-memcpy.patch;striplevel=0 \
glibc_2.3.2+cvs20040726.bb:	   file://arm-memcpy.patch;striplevel=0 \
glibc_2.3.3+cvs20041128.bb:	   file://arm-memcpy.patch;striplevel=0 \
glibc_2.3.3+cvs20050221.bb:	   file://arm-memcpy.patch;striplevel=0 \
glibc_2.3.3+cvs20050420.bb:	   file://arm-memcpy.patch;striplevel=0 \
glibc_2.3.5+cvs20050627.bb:	   file://arm-memcpy.patch \
glibc_2.4.bb:           file://arm-memcpy.patch \
glibc_2.5.bb:  file://arm-memcpy.patch \
glibc_2.6.1.bb:  file://arm-memcpy.patch \
glibc_2.7.bb:           file://arm-memcpy.patch \
glibc_2.9.bb:           file://arm-memcpy.patch \
glibc_cvs.bb:#	   file://arm-memcpy.patch;striplevel=0 \
glibc_cvs.bb:	   file://arm-memcpy.patch \

Frankly speaking I have no clue at all which version of the patch will
be used by the 2.10.1 recipe. The only ways to find out is to study
the class code that does the patch or to actually build the package
(in the hope it selects the patch in a deterministic way). I don't
think it is good that if someone is debugging a problem that they
should have such a hard time to find out what version of a file is
actually used

My proposal:
- only apply patches (seek for patches) in the recipe dir (e.g. in the
example for glibc_2.10.1.bb this would be glibc-2.10.1) and in the
files directory

(optionally we might allow for a mechanism that allows specifying
patches for higher level recipes; e.g. glibc_2.10.1 could look in
glibc-2.10.1, glibc-2.10, glibc-2, glibc and files).

How do people feel about this? Any implementation hints?

Frans



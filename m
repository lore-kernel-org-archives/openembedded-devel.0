Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7kOW-00014Y-8t
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 09:44:33 +0200
Received: by iwn2 with SMTP id 2so890293iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 00:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Qfq8S2NfmLWhsbOFVhqfWyh7u2dO4yxwIy+NUZlTMdo=;
	b=w3WvXL5wfiDtDt7ie8SFBgkIomYiSPcSVa4ocTo4LNnOJb8CF2jptfqWEuKyZiBpHM
	S+gLq6PHDPCXodlQQo8A7VSaR4eMsuh13nHYSbtdMd7xRQ5b83Dy/yvNC7NIN7HFosFf
	59VduBYIr6GHaDh7FL/uaUvoNbp/mp4QyAe1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WtsnKveNI03YsQ7SFvu7Q255vFoJR7eMI8CPT2JR/+n8WzsUyfICGYrUJzYjxi86Km
	cADf0ECS4X4LHQ3ty0agmyahRgzpS1CmraQ9iMbgt/tJF/PqoOwCl7Os99ngYpkDBAAk
	ukn48GFmvJKVUISpFzG2tG0Nz4NzPKHAAHzME=
MIME-Version: 1.0
Received: by 10.231.146.80 with SMTP id g16mr2946966ibv.70.1287387838762; Mon,
	18 Oct 2010 00:43:58 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 18 Oct 2010 00:43:58 -0700 (PDT)
In-Reply-To: <AANLkTimJLCis3ZhSs0Bqj=aY6hX3pXhPLJAj55uX8tdQ@mail.gmail.com>
References: <1286544852-15635-1-git-send-email-msmith@cbnco.com>
	<AANLkTi=9bQq6q8NBTPgHhGMfmLs6Ae+oiLugNd+RyK=2@mail.gmail.com>
	<AANLkTikYuii4mEWxWh7HahgFVzYgaUz-DADyUyibqa4d@mail.gmail.com>
	<AANLkTimJLCis3ZhSs0Bqj=aY6hX3pXhPLJAj55uX8tdQ@mail.gmail.com>
Date: Mon, 18 Oct 2010 09:43:58 +0200
Message-ID: <AANLkTimBs3B9i4hWe4TR-YPVrz9tjWXNqoWDoVWEfuZy@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Mon, 18 Oct 2010 07:44:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/18 Graham Gower <graham.gower@gmail.com>:
>>> On Fri, Oct 8, 2010 at 6:34 AM, Michael Smith <msmith@cbnco.com> wrote:
>>>
>>>> Use shutil.copytree() to copy D ("image") to PKGD ("package"). The
>>>> previous system("cp %s/* ...") missed dotfiles/dirs at the top-level.
>
> I expect this problem could be fixed by adding an extra line, e.g.
> os.system('cp -pPR %s/.??* %s/' % (dest, dvar))
>
> -Graham

Do you mean as an addition to the copytree, or as an addition to the old code?

The patch we had reads:

 python perform_packagecopy () {
-	dest = bb.data.getVar('D', d, True)
-	dvar = bb.data.getVar('PKGD', d, True)
+	import shutil
+
+	installdest = bb.data.getVar('D', d, True)
+	pkgcopy = bb.data.getVar('PKGD', d, True)

-	bb.mkdirhier(dvar)
+	# Start package population by taking a copy of the installed
+	# files to operate on. Create missing parent directories of
+	# pkgcopy first (shutil.copytree() does this automatically but only
+	# in Python 2.5+).
+	bb.mkdirhier(pkgcopy)
+	shutil.rmtree(pkgcopy, True)

-	# Start by package population by taking a copy of the installed
-	# files to operate on
-	os.system('rm -rf %s/*' % (dvar))
-	os.system('cp -pPR %s/* %s/' % (dest, dvar))
+	# Preserve symlinks.
+	shutil.copytree(installdest, pkgcopy, symlinks=True)
 }

Seems adding an additional os.system kind-a beats using the
shutil.copytree as we then still have the os.system to do the cp
I guess the best way forward is to revert the patch and extend the
os.system call with your patter.
E.g. something like:
-	os.system('cp -pPR %s/* %s/' % (dest, dvar))
+	os.system('cp -pPR %s/* %s/.??* %s/' % (dest, dest, dvar))

cp may have mutliple sources if the output is a dir.

Frans



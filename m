Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OnEkp-0004Kz-GG
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 19:54:50 +0200
Received: by wwb13 with SMTP id 13so99447wwb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 10:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Bt5AL3efCQ7HsCdFP+EZvmfn/kmJhWWesSTsCkXs/Dc=;
	b=Ox5WUhgkPKwjtx70wjyB2y6lhGU3E99RHio3HQrqtnMJIuadg4KLlDBY3iFsTLAOjf
	opLa6Driz244ecGGwP6juKrrgadbb0nH0pU+EmoRmQHNJ+Lt0yhFMtxYAuW4efbezBZg
	5FPfBnQC4Ug1O3vKipDVbepSyT0wI0OEiY0/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=xDWtkqgaOWNZL6VLZgFY6Kdp4/6fn4wSuTs50I+mR756EXCM7yWC0XMZeQ3NxwksKb
	iegIfKmcEkWf9QgIt5tuDptayqczeZ9LYoxoWiRzBgo+9P6lvxARQUW1f3fWVFaHUkKm
	quxqWkUvpfxZcfBUTHlGnAG9t/Vf9IdZNl64Q=
MIME-Version: 1.0
Received: by 10.216.93.16 with SMTP id k16mr3531617wef.78.1282499659807; Sun,
	22 Aug 2010 10:54:19 -0700 (PDT)
Received: by 10.216.135.18 with HTTP; Sun, 22 Aug 2010 10:54:19 -0700 (PDT)
Date: Sun, 22 Aug 2010 10:54:19 -0700
Message-ID: <AANLkTi=AYdkOG3e-DmhTNqULsCFHW2bvDGr+M0xTs0HJ@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>, 
	openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: base_files 3.0.14 has dangling symlinks
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
X-List-Received-Date: Sun, 22 Aug 2010 17:54:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

While trying to do a new image I came across this error is it anything
to worry about? Or something that needs to be fixed?  Here is the
error:

NOTE: Running task 8590 of 11052 (ID: 251,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/base-files/base-files_3.0.14.bb,
do_package)
NOTE: base-files contains dangling symlink to /media/net
NOTE: base-files contains dangling symlink to /media/card
NOTE: base-files contains dangling symlink to /media/ram
NOTE: base-files contains dangling symlink to /media/cf



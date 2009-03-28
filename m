Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <methril@gmail.com>) id 1Lnca2-0002lC-Dx
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Mar 2009 18:44:26 +0100
Received: by bwz19 with SMTP id 19so1339078bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Mar 2009 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ml53wEhB5vGxxhoDvjoJtBxYnCir+0q1SEXYpr1p4x8=;
	b=uq2xkbRWaZB+9HlMmdVeu0JEUifBNqDg3aWd50nxbizw2AwCr3ofDSzcI4QvnEHNmV
	tTV8sgJjYMKcQ+j3BDm6BXIGUQomwoPMTsTd4NVoY1d5J1Tv7eYRUOnUUIu6Rn6jgk5E
	nl/0T1ML5lyuB5Zth7uyDtUkpx4E34lNNFxGI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=h+QFP//34JQXz/fuwDEQMFsDTwzRyur8Zh4j9M7tcHbHKlQ8CGzqVVAVDbE89IEShr
	s8Cu8oXfdIuFphrucHtx01/IewjAp0RI4ygte3ZiAVmSPeE8uDEMESOGeiEotaQrKgez
	gPuZR5R3XFq+O/DSpbcKMOc3bDyFcM9RN7h90=
MIME-Version: 1.0
Received: by 10.204.59.18 with SMTP id j18mr1177668bkh.206.1238262148987; Sat, 
	28 Mar 2009 10:42:28 -0700 (PDT)
In-Reply-To: <1237932496.16710.22.camel@alap>
References: <49C94FFC.1040604@gmx.de> <1237932496.16710.22.camel@alap>
Date: Sat, 28 Mar 2009 18:42:28 +0100
Message-ID: <b84dee3a0903281042m552e0b32j9a196b96a95b769c@mail.gmail.com>
From: Rafael Campos <methril@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: python-ecore_svn fails
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
X-List-Received-Date: Sat, 28 Mar 2009 17:44:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

On Tue, Mar 24, 2009 at 11:08 PM, Angus Ainslie <nytowl@openmoko.org> wrote:
> On Tue, 2009-03-24 at 22:26 +0100, Stefan Buschmann wrote:
>> Hi all,
>>
>> I'm trying to build fso-zhone-image for my freerunner, but I get the
>> following error message in python-ecore-0.3.1+svnr39502-ml0:
>>
>> ecore/evas/ecore.evas.c_ecore_evas.c:19373: error:
>> 'ECORE_EVAS_ENGINE_SDL' undeclared (first use in this function)
>>
>> The build system is KUbuntu-8.10 (32 Bit), build-log and local.conf are
>> attached.
>>
>> BTW, I've checked out only the OE tree from
>> git://git.openembedded.net/openembedded. Is this correct, or do I need a
>> different mirror/overlay for OpenMoko/FSO? I'm still a little bit
>> confused about the different OpenMoko-repositories ;-)
>>
>> Thanks,
>>
>> Stefan
>>
>
>
> You should probably try the fso/milestone5.1 or fso/milestone5.5 branch.
> The 5.5 branch is changing almost daily, so if you're looking for
> stability go for the 5.1 branch.
>
> Angus
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

If you apply the following patch (update the EFL requiered verson) it
solves the problem.



-- 
___________
Rafael Campos
o0 Methril 0o
http://openblog.methril.net/
------------------------------------------------------------
From c27a20c08d966ed035290f6371b37ca96e006f19 Mon Sep 17 00:00:00 2001
From: Rafael Campos Las Heras <methril@gmail.com>
Date: Sat, 28 Mar 2009 18:32:22 +0100
Subject: [PATCH] Upgrade EFL revision to 39760

removes compilation crash in python-ecore-0.3.1+svnr39502-ml0:

ecore/evas/ecore.evas.c_ecore_evas.c:19373: error:
'ECORE_EVAS_ENGINE_SDL' undeclared (first use in this function)
---
 conf/distro/include/sane-srcrevs.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/sane-srcrevs.inc
b/conf/distro/include/sane-srcrevs.inc
index 1c01fbc..ae82f57 100644
--- a/conf/distro/include/sane-srcrevs.inc
+++ b/conf/distro/include/sane-srcrevs.inc
@@ -245,7 +245,7 @@ SRCREV_pn-zhone ?=
"f38cc52fbf11f7fe945797a6b8ade29ed479d924"
 # Enlightenment Foundation Libraries
 # Caution: This is not alphabetically, but (roughly) dependency-sorted.
 # Please leave it like that.
-EFL_SRCREV ?= "39502"
+EFL_SRCREV ?= "39760"
 SRCREV_pn-edb-native ?= "${EFL_SRCREV}"
 SRCREV_pn-edb ?= "${EFL_SRCREV}"
 SRCREV_pn-eina-native ?= "${EFL_SRCREV}"
-- 
1.6.0.4



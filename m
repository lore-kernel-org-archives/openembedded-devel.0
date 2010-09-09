Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Ote2l-000767-S7
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 12:08:22 +0200
Received: by wwi14 with SMTP id 14so1398910wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 03:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0Kxacat2tQ8SfSBblgkfKYtVwz5drQKepFCM1trjbCo=;
	b=rdWvtiGFBg+OcAfo/5r1AVhYnu172zrOVlBL5xhsHX8dTdQLrvlAsdI9iXRkwLLeEP
	dA+L+pbQhtE8NI7hITbect4mAB/GWf2ljEKBGeEMGgeImAbdELCLwcZwDXY1EeyO9sP9
	48QyMfBzxYeThJtxfPaXyAR1mxIkYb0eCvFAM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DOzp3AqDTU1H9JkKtAMSUUsgm/kOVw4c1nkZ+gt3aGdGuz9UJj7Ra9G43AIk+97GhD
	62o3tjwpGYY2yUObiRmzdl1Pbq7cX4gTtSAERKGsNLxYoI7OZ+ONGW272g8jVYMX+AFm
	aSvrJJE0m0CF4DGJVG8Ubc+a6opM8t06+o3a0=
MIME-Version: 1.0
Received: by 10.227.146.149 with SMTP id h21mr100001wbv.153.1284026825380;
	Thu, 09 Sep 2010 03:07:05 -0700 (PDT)
Received: by 10.227.152.9 with HTTP; Thu, 9 Sep 2010 03:07:05 -0700 (PDT)
In-Reply-To: <1284024609.28520.1446.camel@mill.internal.reciva.com>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
Date: Thu, 9 Sep 2010 12:07:05 +0200
Message-ID: <AANLkTi=c6e3TZDnG00eMBw7aEas5D49Rrrc5Y4fH=B=y@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Thu, 09 Sep 2010 10:08:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Sep 9, 2010 at 11:30 AM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2010-09-09 at 09:11 +0200, Frans Meulenbroeks wrote:
>> 2010/9/2 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if this_soc_family and not re.match(n=
eed_machine, this_soc_family):
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (this_soc_family and not re.match(=
need_machine, this_soc_family)) or not this_soc_family:
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 raise bb.parse.SkipPackage("in=
compatible with machine %s" % this_machine)
>
> I am still far from convinced that this hunk of SOC_FAMILY code is
> desirable to have in the first place but, if it's going to stay there,
> clearly it should be fixed so that it doesn't cause problems for
> non-users.
>
Same feeling here.

I don't think we should clutter OpenEmbedded with fixes for one rare
case and leave it unattended / non-understood / unmaintained for all
other cases.

Hands up for those who can maintain SOC_FAMILY support. :-)

Regards,
--=20
Leon



Received: from mail-bw0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1PSvMJ-0003dz-IZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 18:41:48 +0100
Received: by bwz12 with SMTP id 12so2496019bwz.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=PB+5sdJmGiPrHzyC+NqQjBQu/dSOLy9fRrq6aQOxzCc=;
	b=TS9moVW8T66EUuY4EDQAx4JjiTOLVreURoCeq+zeHP0mlgk3GkyObQEhyHmDlRFDtZ
	WEUHSt/TBFhAeWAuJ+6OLWQU6zZJdG4MIKWrraZ5Xvoh/WEzQxNwM+c5UZMioLZ5iB4S
	hItXZR8ulcaStIXRwEKBxqVA0R0AtDaQf+Z5s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=cOy06lhZeDp18BTjWTHC6laLKoRzQ1WbE6eZpBIvQDaDPcwJrjNuP4z26mXm0rIfWf
	RvY5KahZ633KMitd/1Lg2D9xrqxPCmIMrb4mEAubQr1g7Fjva/hahG2GzdYetPFrBVN4
	pkDRA4iIyWDlknwB2sIy/ekUkTlH8MrEFhcKU=
MIME-Version: 1.0
Received: by 10.204.74.74 with SMTP id t10mr4957744bkj.161.1292434811635; Wed,
	15 Dec 2010 09:40:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.71.8 with HTTP; Wed, 15 Dec 2010 09:40:11 -0800 (PST)
In-Reply-To: <4D08F85B.30407@opendreambox.org>
References: <1292416949-688-1-git-send-email-otavio@ossystems.com.br>
	<1292417425-1328-1-git-send-email-otavio@ossystems.com.br>
	<20101215130120.GB3238@jama>
	<AANLkTin_QS4A+UM2Oj3K82i+rtC4Qd_aD=oTDQ3iZB7q@mail.gmail.com>
	<AANLkTikSQRgPsWPx2D8kc78T=gyK6HcQxfsDxzwy9_7J@mail.gmail.com>
	<4D08F85B.30407@opendreambox.org>
Date: Wed, 15 Dec 2010 15:40:11 -0200
X-Google-Sender-Auth: pjbEMS_W1U2xf8-df-pSMKUpJNQ
Message-ID: <AANLkTinAvaADS1N=_JQfagX3i9hN9QhPn2USrq9T8SSh@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.44
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classes/gitpv.bbclass: use 'git describe' to for package version
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
X-List-Received-Date: Wed, 15 Dec 2010 17:41:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2010 at 15:18, Andreas Oberritter <obi@opendreambox.org> wr=
ote:
> On 12/15/2010 05:36 PM, Otavio Salvador wrote:
>> On Wed, Dec 15, 2010 at 12:27, Otavio Salvador <otavio@ossystems.com.br>=
 wrote:
>>> about assign to PV ?=3D I agree however why someone might want to use i=
t
>>> only in PKGV?
>>
>> ?=3D doesn't seem to work. PV is preset so it won't override it.
>>
>
> How about PV .=3D "${@get_git_pv(d)}"?

It ought to use the get_git_pv output _only otherwise you'll get a
confusing string.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



Received: from qw-out-1920.google.com ([74.125.92.145])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1NE57i-0007BX-2n
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 19:00:53 +0100
Received: by qw-out-1920.google.com with SMTP id 4so277858qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 09:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=a4gs2MIT1PgLe/aTxIasF8whJGZlBYoPMJBJwW+lHQU=;
	b=IfMPgNWx+1yq3Gfej5ahg+spqweosykIAjy0e8SlkhAqRZVV/3WQSKN43lGsoCYt3h
	C5+xHpT/W6yQqngDO6BdksH5RqJsRfONRfLex7fNYzLt1ZIKX54ZkACOy6jRX3XLt37F
	5ecj56QPNiunGqvHVb0+zYgTngNMDwtn3pVlQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aN5p4tvkSNlKJlBfKhEuistnxLoAMSSUgKWkJCyWP/6tLfDfZfzgGKP5pk5NwB6OAd
	Jv/aVM6ckPmVHPcFm/Ck85RmB9Yq67Ta1DXZu4FHbljn/BMfRCocY9r4ZR6ApbE/VuNX
	lefKjk23SOxspsH8ItLjOcpdSBvJY636tzF2A=
MIME-Version: 1.0
Received: by 10.229.49.137 with SMTP id v9mr172292qcf.21.1259344759910; Fri, 
	27 Nov 2009 09:59:19 -0800 (PST)
In-Reply-To: <20091126093031.GA3354@jama>
References: <E1NDaYW-0003Fx-Nr@melo.openembedded.org>
	<20091126093031.GA3354@jama>
Date: Fri, 27 Nov 2009 09:59:19 -0800
Message-ID: <5e088bd90911270959k35e5ab34u6e79b654abbe37b7@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.145
X-SA-Exim-Mail-From: sakoman@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Steve Sakoman : gnome-mplayer: bump SRCREV
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
X-List-Received-Date: Fri, 27 Nov 2009 18:00:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2009 at 1:30 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Nov 26, 2009 at 09:22:28AM +0000, git version control wrote:
>> gnome-mplayer: bump SRCREV
>>
>> ---
>>
>> =A0recipes/gnome-mplayer/gnome-mplayer_svn.bb | =A0 =A04 ++--
>> =A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/gnome-mplayer/gnome-mplayer_svn.bb b/recipes/gnome-=
mplayer/gnome-mplayer_svn.bb
>> index 5540f94..2769bcb 100644
>> --- a/recipes/gnome-mplayer/gnome-mplayer_svn.bb
>> +++ b/recipes/gnome-mplayer/gnome-mplayer_svn.bb
>> @@ -1,7 +1,7 @@
>> =A0require gnome-mplayer.inc
>>
>> -SRCREV =3D "1569"
>> -PV =3D "0.9.8+svnr${SRCPV}"
>> +SRCREV =3D "1583"
>> +PV =3D "0.9.8+svn${SRCPV}"
>
> Did you remove 'r' intentionally or is it a typo?

Sorry, it was indeed a typo and I see that Koen has already fixed it.

Steve


> I was trying to make svnr consistent in OE tree and only few recipes
> were using svn without 'r'
> http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=3D6ca479d37=
af6d1e4e89e5dac0dc5b2fb81819c2b
> if this isn't true:
> * Should be safe as version svnr[1234567890]* > svn[1234567890]*
> then I should fix more recipes
>
> and if it is true then your srcrev bump won't be upgraded for people who
> built gnome-mplayer between 6ca479d37af6d1e4e89e5dac0dc5b2fb81819c2b and
> this change.
>
> Cheers,
>
> --
> uin:136542059 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0jid:Martin.Jansa@gmail.com
> Jansa Martin =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sip:jamasip@voip.wengo.fr
> JaMa
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



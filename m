Return-Path: <erik.boto@pelagicore.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 247CD6013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 14:21:16 +0000 (UTC)
Received: by qcrw7 with SMTP id w7so26765314qcr.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 07:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=gPeC6oKh13dvbRGZqodOUpLQrIT93VFa+78a2FXoFSA=;
	b=Wmu/yZ2vIJ9Xc3qzwQ4lFwD/xnL3HcWi7o3MKEPDlrJTpQnGN3GvEijzvGwv9HyrIt
	QkL7cFb6Ctt7lYQ1IojJ8MBZobirvOHDTsH8NLC6nIY/ZsbT7m2pRx+2vgCFXVI2K57K
	S/aOYEendpadLagC0S7ad+0aMaXaX+rVa1yu+XLmECtnEgqbiFatgcfaVMmnSHPv57Zm
	MMdCAdGQwH1vusILcM7r5iSC4LwKadvXYGKjCCa6X4pBCjj7IU/LrJkkBMVAeBa6kal5
	6fHHqhICHm82NXrtzJ8AV6nsd+dfJthkJxjmNnEP2lQkjAYsdTIChT84WNkrAegzsMpn
	oFYQ==
X-Gm-Message-State: ALoCoQn/nGx9oxB5A6LWXJTx0+7oYDWdDHnGZiNvNuL4c4Pg5JlQBuLhWFKyqlpJM7FtBt8y/mbi
MIME-Version: 1.0
X-Received: by 10.55.22.213 with SMTP id 82mr48171147qkw.103.1426256477532;
	Fri, 13 Mar 2015 07:21:17 -0700 (PDT)
Received: by 10.96.184.133 with HTTP; Fri, 13 Mar 2015 07:21:17 -0700 (PDT)
In-Reply-To: <20150313135046.GC2345@jama>
References: <1426231791-25435-1-git-send-email-erik.boto@pelagicore.com>
	<20150313135046.GC2345@jama>
Date: Fri, 13 Mar 2015 15:21:17 +0100
Message-ID: <CA+AhUGzJTR=bYuPXOeghfH34Cf7XgQGNC19Z+scdSm0ZWhP9Yg@mail.gmail.com>
From: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][daisy][PATCH] qt5-git.inc: Move to code.qt.io
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2015 14:21:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2015 at 2:50 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Mar 13, 2015 at 08:29:51AM +0100, Erik Bot=C3=B6 wrote:
>> Gitorious switch of git:// protocol and will close down in a while, so
>> move over to code.qt.io.
>
> This isn't enough.. I'll cherry-pick commit from master instead.

I only found one reference to gits on gitorious on daisy branch, but
as long as it gets solved I'm happy. Tried cherry-picking myself as
that was my first approach, but those commits changed files not
available on daisy.

Thanks,
Erik

>
>> Signed-off-by: Erik Bot=C3=B6 <erik.boto@pelagicore.com>
>> ---
>>  recipes-qt/qt5/qt5-git.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
>> index fa0c06e..2281b75 100644
>> --- a/recipes-qt/qt5/qt5-git.inc
>> +++ b/recipes-qt/qt5/qt5-git.inc
>> @@ -5,7 +5,7 @@ QT_MODULE_BRANCH ?=3D "stable"
>>
>>  # each module needs to define valid SRCREV
>>  SRC_URI +=3D " \
>> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRA=
NCH} \
>> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>>  "
>>
>>  S =3D "${WORKDIR}/git"
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



--=20
Erik Bot=C3=B6
M.Sc.E.E.
SENIOR SOFTWARE ENGINEER

Pelagicore AB
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46 (0)768 817 203
E-Mail: erik.boto@pelagicore.com

PELAGICORE Experience Change


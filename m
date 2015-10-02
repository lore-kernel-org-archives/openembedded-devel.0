Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id C715C770B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Oct 2015 16:42:03 +0000 (UTC)
Received: by iofh134 with SMTP id h134so126364098iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2015 09:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Dzgg266xD7uO8YDh+0NAG3yYPY8vnSBfl7qHSIP94do=;
	b=nLXQ5s7fosGxma5r7uD8Vk3VImRRZLIjRphxbGptG8S0u19oqwVyUtt5JRziWx5ZOe
	le+X8KGwvtd4Tx+dI8hIhZaAcAhKsZQPbjbmO98FWlrbSV6HZTCqwAIOic88YW6mSBsg
	8Ut4zbc5xvqmQsTH4J+txZs2N3OwJLeB5ij8iHnSFepcrCe1mMbkP8RXGQ2F0VvpLNBv
	6mueSust3eJyEIflq+cTzIi32hOUIPFSMcoUwd3Cp20hFXtTed8DYgFc1lgmTmqCPW8o
	noliXt9VEV1xst14hiLFG25B5daoex3ACetp8RFq4wBJSC8XUWAf3qdQm6owOWMlGrOc
	/Obg==
X-Gm-Message-State: ALoCoQlacYfGOiqj7lk3tD03ncRJNaKCwk4sWBXOwFk2NEO6GK/esdKjRJ8r1s7eSOHb5aRuSf32
X-Received: by 10.107.132.222 with SMTP id o91mr19591391ioi.172.1443804124021; 
	Fri, 02 Oct 2015 09:42:04 -0700 (PDT)
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com.
	[209.85.213.174])
	by smtp.gmail.com with ESMTPSA id kr9sm3867377igb.1.2015.10.02.09.42.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Oct 2015 09:42:02 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbni9 with SMTP id ni9so20246184igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Oct 2015 09:42:02 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.147.71 with SMTP id ti7mr5020524igb.19.1443804122260;
	Fri, 02 Oct 2015 09:42:02 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 2 Oct 2015 09:42:02 -0700 (PDT)
In-Reply-To: <D8A82570-8C75-4DA8-B884-13747427A3D4@gmail.com>
References: <1440032144-18482-1-git-send-email-vinay.k.awasthi@intel.com>
	<B399646F8CA055479BEC55F6B065A04A370ABB95@FMSMSX108.amr.corp.intel.com>
	<CAP9ODKrVXpZ-ZhZ=1SjAdqtrOpD=XO1DJaruGef4OyhT-uDd1w@mail.gmail.com>
	<B399646F8CA055479BEC55F6B065A04A370ABF6A@FMSMSX108.amr.corp.intel.com>
	<D8A82570-8C75-4DA8-B884-13747427A3D4@gmail.com>
Date: Fri, 2 Oct 2015 13:42:02 -0300
Message-ID: <CAP9ODKo3wQZqorptjghXrjzTo3jkZj8zPn3-6BbvCvmWM2XuBw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
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
X-List-Received-Date: Fri, 02 Oct 2015 16:42:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2015 at 12:50 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>> Am 01.10.2015 um 00:58 schrieb Awasthi, Vinay K <vinay.k.awasthi@intel.c=
om>:
>> I do see configure here .. /home/vinay/YOCTO/NEW_META_JAVA/build/tmp/wor=
k/x86_64-linux/openjdk-8-native/72b00-r0/jdk8u-d0afaafe3790/configure but f=
or some reason build just bails out..
>
> I told you in private mail yesterday evening, you have to apply https://g=
ithub.com/rehsack/poky/commit/9aa003359f9d804544ba68fa812dd65915c4901b in p=
oky before running openjdk's autoconf procedure. It's because of poky unlin=
k's all "configure" files and expects running autoreconf brings the fine on=
es back.
> OpenJDK has a weird perspective regarding "fine ones" ^^

I agree the OE-Core change should be included indeed but I also think
we could work on a temporary solution using a do_configure so it could
be used with Fido, as well.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


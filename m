Return-Path: <riku.voipio@linaro.org>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id B77FD6CC34
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 07:44:55 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id l4so4475388qcv.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 00:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=d1Q+dWtM/VWVshBZ33t1C0QCag34ZVIAPYlAE5bed1Q=;
	b=YvvRxG2RWevRfmnueiWGwfM0DjWyg49NFBrMZEFswp01EZDtBjuxC+lkCQVmzoWT7h
	phIdsCl3XdY1GwymGM9zt2WcLRJBhbvaa4at3MBHi6g6NkmDeAuwPW+pU/eZJwurGJ04
	uUPpw9x95MzFcVa3eA2vHtc5v7nHJX2CVV4SeAuY2u0iBqoMdrg7DOd5FydoIQz3iUCY
	7N1eFIX2m+8DjGaODstKaM9fhsZwnGztEdURcg7xAx3pSMip/wdqh/xTbhx7CvN9R1mp
	aQewDxczv3sMNeM8jLqfNjfOfLCMXQCQmMPM/akzRRcGero1pPJxs8DOIjK6z26rFvMQ
	FcUg==
X-Gm-Message-State: ALoCoQkex2mfBlHqE0PngDnHzlrDsCrjS8ikWMD11/AWsGBSMsskyvhGmKikk5TQVwmtjA00opdM
MIME-Version: 1.0
X-Received: by 10.224.129.134 with SMTP id o6mr157239qas.107.1380613496768;
	Tue, 01 Oct 2013 00:44:56 -0700 (PDT)
Received: by 10.49.71.232 with HTTP; Tue, 1 Oct 2013 00:44:56 -0700 (PDT)
In-Reply-To: <20130930193046.GB22970@mail.zedat.fu-berlin.de>
References: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
	<1380548771-13812-3-git-send-email-riku.voipio@linaro.org>
	<20130930155838.08e5f9d4@e6520eb>
	<20130930193046.GB22970@mail.zedat.fu-berlin.de>
Date: Tue, 1 Oct 2013 10:44:56 +0300
Message-ID: <CAAqcGH=MgJOj_f08u8LA1NMJd6-bT2xC=uLQvee2sKtbh+1pOw@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: Henning Heinold <heinold@inf.fu-berlin.de>
Cc: openembedded-devel@lists.openembedded.org,
	Patch Tracking <patches@linaro.org>
Subject: Re: [meta-java][PATCH 3/3] jamvm/java: allow spaces in arguments
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
X-List-Received-Date: Tue, 01 Oct 2013 07:44:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 30 September 2013 22:30, Henning Heinold <heinold@inf.fu-berlin.de> wrot=
e:
> On Mon, Sep 30, 2013 at 03:58:38PM +0200, Eric B=E9nard wrote:
>> Hi Riku,
>>
>> Le Mon, 30 Sep 2013 16:46:11 +0300,
>> Riku Voipio <riku.voipio@linaro.org> a =E9crit :
>>
>> > Current IFS mangling blows up on the face:
>> >
>> >     | configure:2341: javac  -classpath .: Test.java
>> >     | Invalid maximum heap size: -Xmx1024m-cp/srv/oe/b
>> >
>
> Which shell blows it up? With dash on ubuntu its working fine.

I'm using bash (oe handbook tells to switch /bin/sh from dash to bash.

$ cat test.sh
#!/bin/sh
IFS=3D""

exec echo jamvm ${1+"$@"}
$ dash test.sh foo bar bar bar
jamvm foo bar bar bar
$ bash test.sh foo bar bar bar
jamvm foobarbarbar
$ vi test.sh

While the simpler version:
$ cat test.sh
#!/bin/sh

exec echo jamvm "$@"
$ dash test.sh foo bar bar bar
jamvm foo bar bar bar
$ bash test.sh foo bar bar bar
jamvm foo bar bar bar

seems to run fine (echo added in both for clarity)

Riku


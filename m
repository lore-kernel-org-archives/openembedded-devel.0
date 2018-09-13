Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id DF2687989C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 11:09:01 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id m11-v6so9045353oic.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 04:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LAHaqdj7Ogakfk6Koy6G7xF5jugCBt+5DllE+fsYQLw=;
	b=kuQMci7m0WBiukitov1Vw+AVhVwlalRpvyjwksCmfGL7x2C5VTv+N1NTEolu0F0OPu
	uLuDxv/TQq3p076fwpOdYIVPMmicxKGrjUgxj4PbxOF3xNoVKOkU551q2D3Io1TgP0ro
	UMnxTbnZ+qt14/631bJHSRyIk14z6F4qymmPv9gcEQeQb4GxsRRTlpnM4KR5txagYKVG
	2JZLdRIiYv8oGjnsejs1U+o5ZeyVKkNm4nEYlr/ODAYRYnQ4SRoVOiwNsL2d5waDlA/W
	SD27vRjLz+HvoUvoH68Wi15Y4f5cDbUhB81nkc8kEkZq51so1cJH8P/kIo4G7V6WTsth
	PQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LAHaqdj7Ogakfk6Koy6G7xF5jugCBt+5DllE+fsYQLw=;
	b=DiGT7LwtZvTjYCH1tbSiMJA/gPLObTA3+5JNnKU5xeh5LhZLDGmePJwU3qq4rjuNQh
	g6cemMlolkgV1jFMMg2Jwm0hpGnK0wbZ5//1IEW1iNIOGfFjwTnh5imdZtC6j+lyqjdp
	A+VVuEokeL0drN3OgIu03EfPGRNZFRPf83wSCXrxH7NJqBQ8ql63tJY5WhuwTWQBRCF+
	yP3NLqsAz1sLJ9pxvgmm7lUGwqmMBB+HUWpRF5rgNM2RH3gO5qkvVBDcM+i7oD8VVdK4
	BVBouI+GCoRnr5qrGa6B/ylR503v3/kPlf8i3gRXui5Rqj5sBrFhR58Qyq1Mi0EZ2YJe
	SldQ==
X-Gm-Message-State: APzg51CmT9XAdi9jH5aDNRiYxrX5OkSDR8ax8aBI7ja9ANhghUzOJDpC
	xfdkh2o5FFNy6eD9hrSpYEXkh9SOX9zUvlLu8vfr/22A
X-Google-Smtp-Source: ANB0VdarEnV24A+EoJ2Rl46eu6AgbgJtLTV5ZSmkaEvB27A4ohRSbogWcfxQ8kRIWcNLCdM+iUlz4wwpO7ybdCh8QpQ=
X-Received: by 2002:aca:4aca:: with SMTP id
	x193-v6mr3242074oia.211.1536836942909; 
	Thu, 13 Sep 2018 04:09:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Thu, 13 Sep 2018 04:09:02
	-0700 (PDT)
In-Reply-To: <CANNYZj9-NzKB+P0OyVfd2tk_8cMUFT11-y8t28xNoAV1R6C2yA@mail.gmail.com>
References: <fbed68fd-3ec8-6058-e43b-329232c1e960@windriver.com>
	<20180913093452.357414-1-mingli.yu@windriver.com>
	<CANNYZj9-NzKB+P0OyVfd2tk_8cMUFT11-y8t28xNoAV1R6C2yA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Sep 2018 13:09:02 +0200
Message-ID: <CANNYZj-cOrvsqv-GJUgusANWDAar3OcGcNyxW-d3QKV_+4F2Yg@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] postfix: fix pkg_postinst_${PN}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2018 11:09:02 -0000
Content-Type: text/plain; charset="UTF-8"

Ah, now I get it - there might be more lines in the postinst script
added from elsewhere. Correct?


Alex

2018-09-13 13:07 GMT+02:00 Alexander Kanavin <alex.kanavin@gmail.com>:
> I might not be understanding this. Why is the original fragment
> incorrect and the new one correct?
>
> Original:
>
>         # This can fail depending on host setup
>         if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
>             $INTERCEPT_DIR/postinst_intercept delay_to_first_boot
> ${PKG} mlprefix=${MLPREFIX}
>             exit 0
>         fi
>         touch $D/etc/postfix/virtual_alias
>         postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>
>     fi
> }
>
>
> Patched:
>
>          if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
>              $INTERCEPT_DIR/postinst_intercept delay_to_first_boot
> ${PKG} mlprefix=${MLPREFIX}
>          else
>             touch $D/etc/postfix/virtual_alias
>             postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>          fi
>
>     fi
> }
>
>
>
> What problem is being fixed here?
>
> Alex
>
> 2018-09-13 11:34 GMT+02:00  <mingli.yu@windriver.com>:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> "exit 0" will break the postinst logic
>> below the line "exit 0" such as:
>> ===
>> update-alternatives --install /usr/sbin/sendmail sendmail /usr/sbin/sendmail.postfix 120
>> update-alternatives --install /usr/bin/mailq mailq /usr/bin/mailq.postfix 120
>> update-alternatives --install /usr/bin/newaliases newaliases /usr/bin/newaliases.postfix 120
>> ===
>>
>> It's enough to call "$INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}"
>> , so remove it to guarantee the postinstall logic is correct
>>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>  meta-networking/recipes-daemons/postfix/postfix.inc | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
>> index 49f9f7b1f..882b27b6e 100644
>> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
>> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
>> @@ -246,10 +246,10 @@ pkg_postinst_${PN} () {
>>          # This can fail depending on host setup
>>          if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
>>              $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
>> -            exit 0
>> +        else
>> +            touch $D/etc/postfix/virtual_alias
>> +            postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>>          fi
>> -        touch $D/etc/postfix/virtual_alias
>> -        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
>>
>>      fi
>>  }
>> --
>> 2.13.3
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


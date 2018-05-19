Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4193074D87
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2018 19:44:06 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id e1-v6so4680877pga.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2018 12:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:references:subject:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZGJPS1/dqYXtCUelTZOIOwr+fTB4ufKFQb1egH8zd74=;
	b=MMi7jgxxQ/SEN7dW8AMVe2KoYl3H0+I2TOoWnAsqh7g8EWBDfCOxd35rkaNYtHJAuv
	AsD9SWt2t4tZX9g1n4T4lJzUPKMTGTwWWDYOHlr7uRTBs3Jea0VULeWK/zbxLmwDz88g
	KwCew9Joyeb3ZWr6UlLEi+EYFuE1R55YspY5AvUV8Hanc941bwckngunO3dmmxebUsLV
	rSTVLF3/s6nM+Ns9e4COD9FmgAz3S8VISpB9d0a6xpX6cipTUS+gtBA1/wvvMfY7HO1k
	7+2UMD9RfqPUW8s+OF6EHuWpk9sMdRnOgXP8RvOETe7k6ZwDr2Muf+5bD9a6/l1n12MU
	SQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:references:subject:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ZGJPS1/dqYXtCUelTZOIOwr+fTB4ufKFQb1egH8zd74=;
	b=W1EmCtDrn5E8MlIz+Sysn3OKbNg/9foB7Qn6EjKW911Xbn9fc39EP+CfKFuZH/tOZC
	bR09ahAKtqT3S3CUOtiY/j3dTV4KLc8mFHN1topxD7mTK9Jj68dy9A2DgbdTRntDE64A
	pA87ghVLJE9FgozKeDD8kc1/0P4/+O8sQp+B1I5shRKK84mNOSC7PJWfzVTcz7L/dpqC
	kI48/+wxxRENd8oBgp5y1UpjCTa19rL6hO45R6f7QOgGUMCpXC+zthFDBFr3t3A4RXAn
	K+4Q73edy5GnilUWfy4GvyAhNEm2/TiA+vEsBCijzDevGgNZHoIlooxdQ2QgiHMZOYxe
	I3pA==
X-Gm-Message-State: ALKqPwflrcqDg8JVwkq7z0rVytdb10QI7etpx52eB7uSWUlAsvpEAJhO
	KeHNKFzu5DYB0RALlUQ42pEUu0O/
X-Google-Smtp-Source: AB8JxZpm1sHQXY5ouUXlINucvwnVvuOq+p6jtkIswrZTUR7VAgYd1awJ0Ngj+cqWdAUuLONkmImkEA==
X-Received: by 2002:a62:d605:: with SMTP id r5-v6mr14400150pfg.8.1526759047656;
	Sat, 19 May 2018 12:44:07 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:a178:f00:e4c0:10c5])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm13632679pgp.30.2018.05.19.12.44.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 May 2018 12:44:06 -0700 (PDT)
To: schnitzeltony@gmail.com,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20180518214228.25819-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <fb3745f4-8a86-4e92-3790-b4a7ef5e4f4a@gmail.com>
Date: Sat, 19 May 2018 12:44:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180518214228.25819-1-schnitzeltony@gmail.com>
Subject: [PATCH] evince: update 3.28.1 -> 3.28.2
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
X-List-Received-Date: Sat, 19 May 2018 19:44:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Andreas

I am seeing an error building with clang

| ../../../evince-3.28.2/cut-n-paste/unarr/common/unarr.c:106:22: error: 
format string is not a string literal [-Werror,-Wformat-nonliteral]
|     vfprintf(stderr, msg, args);
|                      ^~~
| 1 error generated.



Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D164171E10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 23:14:15 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id c206so92420879wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 15:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Lz2wNgqC7zrC+itUGL6SfNftTtkDghCtntS/DeghDk0=;
	b=Gu0H+RhSrOLUtMN5+iYRz9FJktquIqRuQmFJHSK0PBYDy1LxgxPY251+pNWlMBFhdd
	ubO0Sb1oUimy1/H9usyqPyiZTOajMwrUWQJssCi8kMsoRuA2jj1wMVNMJwEtR/nRTWYK
	o7RtUFzEiEW6OupQBujTHe1HN3x1XQHg1J5MQaOsW8QBnkICtIa7jPMjhf78PWEEnz1+
	tqZrYIOXokwXf13xNAkNxsSK6QPUwMNK+bHqPYyExEvne31Nbipm8E6xbfqtSSkX6ddR
	i48ZEDGpWa7tWgIlKL8VjU1J1NWbXNEfDpfsXj30oaUHR3B35wK9iT5Igixn0rdEP0a8
	rITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Lz2wNgqC7zrC+itUGL6SfNftTtkDghCtntS/DeghDk0=;
	b=JF+uKWU/SNVEJ6LcoYAEKuUvNy/VswdkNBBJDIucxj301Otvz/U7MRN38PWiTp7YTS
	ViobpcoFGuTSE4SxuZgty1hldX1CUt8mkZdC/ip7FOXfHIu1TBJQB0+5k2vOA1urmVXY
	LMWU+O1gD9mrIxTQA5YDzmTMelqpPDvd8hllierk68npsNGEdmJ1LTGUyiXA+I5kN72r
	hL4gucZ8A0OfZaxd1XQIJoNvrv3EbFjQQcYTnKsi3d/VuNheUygReJ8Yk9IdlBQVWbbN
	iUdjNZV4gBCSWirB/yo/1ryXs+EP6/EEtA3rm1yJ3nMoC61tsXxMd2RBVoHeJc4nlWtk
	Oguw==
X-Gm-Message-State: AIkVDXIadHIhbHNafadvkJuVx17KYbh6Vs1DDXJ6awM68TMyUKa8D9hrw1ASU//oA8Er6I7Nq80cEwTXgOl9Vw==
X-Received: by 10.223.133.220 with SMTP id 28mr13573926wru.97.1484349254052;
	Fri, 13 Jan 2017 15:14:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.248.129 with HTTP; Fri, 13 Jan 2017 15:14:13 -0800 (PST)
In-Reply-To: <CA+chaQeef99dR4hF4psmfncu_yO3=ZhxYS8812Sy4acLoJzvLQ@mail.gmail.com>
References: <1482166593-14228-1-git-send-email-armccurdy@gmail.com>
	<CA+chaQeef99dR4hF4psmfncu_yO3=ZhxYS8812Sy4acLoJzvLQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 13 Jan 2017 15:14:13 -0800
Message-ID: <CAJ86T=VYWQTSEho0yFA++G52MVjZ2=H8o6zdNg6We6QLBD8GGw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] rapidjson: add initial recipe
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
X-List-Received-Date: Fri, 13 Jan 2017 23:14:16 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 13, 2017 at 8:06 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Fails to build here with:
>
> rapidjson/1.0.2-r0/git/test/unittest/unittest.h
> <https://anaconda.lgsvl.com/jenkins/job/webos-pro-jansa-master-test-dependencies-qemux86/ws/build/BUILD/work/qemux86-webos-linux/rapidjson/1.0.2-r0/git/test/unittest/unittest.h>>:92:83:
> error: throw will always call terminate() [-Werror=terminate]
> |  #define RAPIDJSON_ASSERT(x) if (!(x)) throw
> AssertException(RAPIDJSON_STRINGIFY(x))
> |
>

It looks like the unit tests somehow got enabled in your build,
perhaps because gtest sources were found on host? I'll send a v3 which
disables unit tests explicitly to make that deterministic.


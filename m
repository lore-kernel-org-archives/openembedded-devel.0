Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id EB4F7771A7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 16:02:07 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id mw1so18119238igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 08:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=MrPiIuzjcVQaJy9r+OUqiIRmf1n/0OBaEdAzgQU8t2o=;
	b=ubqrDpSyIlb1PP4/u6x/Exfy/JrO6nJaCB3kilheDvpeafAUWTY2k5c+6uVzjW+QmK
	fb0d99cbvszjlhx0Se5PJwJPlEt+hG1vvziSv7wFZ3g0OyTx7M4OOu9Tpw4zAs4w61aX
	JNlImSBdSh6TUtjajD+hjRiuVFWCSyOmTELwvzzZhA4UPCfDtfUx6U9Bk6nFPDdNsY2x
	2CdB5zy3ueqV06PE2+WdLyeOZprAQJKjddR44ylCNxTIRetVgIjYJUS0QaKiCAlYdBIL
	owj/zv3WQW/we22/Vcxju7oJklmH1FXymggVyP4i1W1SCLiadz7SGpLOblIJQDX/WvwP
	EfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=MrPiIuzjcVQaJy9r+OUqiIRmf1n/0OBaEdAzgQU8t2o=;
	b=Knu4068STGEUo+R6hO3Rpoz+Oux7LTouGo52nLAa3Z464mKMxvYntEGiRk48jLOXkC
	W+Q9iXpc0KB/bVj1xp2NW02NCV1YBH/AP351T2Go7nuSjK0ljbsfJEXdKfpk28rbwM/j
	M8ajsiwpUw0gzDgTLUFZ/SDa5u1dC6VNnrb57AfoDWYQ4FxW/yv47omKz7QpgNQsnbxn
	eXCEZK8d7AzzBhu9JVKTGwbbRk15zWDy4nT5H2S5yXfzCD/eT5sSUTtSGV+3WBSazjpd
	Ivxn3+LY02uSqh6fEzvRlzs8J4PlON886zU5jIdghKsEqL6zaeP1h/ALQ56FJMaW5kWs
	kXOQ==
X-Gm-Message-State: AG10YOSEWeGXPUDBI9h6/8TwLXnaJRl6c8uAfyBYacMd7VuGDdG+FrYDlQ5az/Iz8UW/XI3lv6VSe9l0l17aHw==
X-Received: by 10.50.171.200 with SMTP id aw8mr7118012igc.77.1454256128469;
	Sun, 31 Jan 2016 08:02:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Sun, 31 Jan 2016 08:01:39 -0800 (PST)
In-Reply-To: <1454254968-8596-2-git-send-email-sven.ebenfeld@gmail.com>
References: <1454254968-8596-1-git-send-email-sven.ebenfeld@gmail.com>
	<1454254968-8596-2-git-send-email-sven.ebenfeld@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Jan 2016 08:01:39 -0800
Message-ID: <CAMKF1sqD+vsprAKVV97YxXdbApfzkZCKKpdLQzZ40hqOoir=iQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] mongodb: 2.6.0 -> 3.3.0 and remove from pnblacklist
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
X-List-Received-Date: Sun, 31 Jan 2016 16:02:08 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 31, 2016 at 7:42 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
> -DEPENDS = "openssl libpcre boost libpcap"
> -# Mongo uses tcmalloc on x86_64, which is provided by gperftools
> -DEPENDS_append_x86-64 = " gperftools"
> +DEPENDS = "openssl libpcre libpcap zlib"

why is gperftools dep dropped ?


Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7DAEF7708E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 14:40:30 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so34963650igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 06:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=wGqbbAQ+qUUfeGhANkTA6kJ1s3ujv8KgfQly8xew8T0=;
	b=N3gHluP/EJfaYYl37RMs2ToVCtF1uUBnOiy6X7LYK53MDPlrxp6MiZ6cdgk4Oo1LsK
	2MIUaSHlDcNnQNRjQfkwXyXax83MyBRmmkcuhxrsIRT1VQADMdxYV7t+G+2OIcah6F8K
	m0nGgBmT3AJRfiAgtVRh4zv8E1AIgRiANQuTXTyBmCH6PMS/Z0JdTbe2/4ZAlJh04GAo
	qFX5ZDJsdDRJYChgNmhGXqipuMHpCw/K5on5xqlTV7UOsHE3gAMD2HqYS4iP6uqORZ11
	LnP5fXI3VQc+IN6O6oHUX4bdkF/RZepfBUp3w6rjTyM5/mNJKPu/V75oJ3CvmSq5yZbM
	giKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=wGqbbAQ+qUUfeGhANkTA6kJ1s3ujv8KgfQly8xew8T0=;
	b=SRIF/mSmHdE3MB4i905ezIFQFuhkUmo72qeW2U+Dc/sSsjrG1fbQGQA+mdIe1yp3Mt
	GPfbBEkEuSK8JJl+PNPH1c0yk4EBXUTXCF9cU5vraNZN5TDwxqkEWyzqBeLd4mlcQLkt
	R1RQ7bh2Q2M994ZmTvfFWV5VQPCi++JGV44hJ0dtoPH922H/7ora/lLBLiX9D9h4Hb6H
	ykGgDOeKg0p/44t10d53rgFRV/sCBvd043/eUQEow+qySgL56qJw48wbheqgiwFgYtv3
	MB/IxbKoVRrdj1m+zII107rX4msvdnYBAYR4SfYj29Rr3B/z8dxjH9pRxWMdU3e+RP6g
	wVGw==
X-Gm-Message-State: ALoCoQkFCVKfKpPhW92RodBUx7PrbMuo9wtZM63ExkB+zEfO7JU9n1b/7RQ5cR/nVTYuLm8ESiZZ
X-Received: by 10.50.66.197 with SMTP id h5mr8778703igt.82.1446820830247;
	Fri, 06 Nov 2015 06:40:30 -0800 (PST)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com.
	[209.85.223.170])
	by smtp.gmail.com with ESMTPSA id o3sm318285ioe.11.2015.11.06.06.40.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 06:40:29 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iody8 with SMTP id y8so125668113iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 06:40:28 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.131.147 with SMTP id n19mr15286140ioi.192.1446820828868; 
	Fri, 06 Nov 2015 06:40:28 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Fri, 6 Nov 2015 06:40:28 -0800 (PST)
In-Reply-To: <17C19527BD855F428F22685986FD58BEA213D3@IRSMSX106.ger.corp.intel.com>
References: <17C19527BD855F428F22685986FD58BEA213D3@IRSMSX106.ger.corp.intel.com>
Date: Fri, 6 Nov 2015 12:40:28 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpP17FSRs+iNU=nne4empeDXCJbVq07ydq-6MoGAmO+yQ@mail.gmail.com>
Message-ID: <CAP9ODKpP17FSRs+iNU=nne4empeDXCJbVq07ydq-6MoGAmO+yQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Sporadic segfaults when compiling jamvm-native and classpath-native
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
X-List-Received-Date: Fri, 06 Nov 2015 14:40:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2015 at 9:44 AM, Kaaria, Erkka <erkka.kaaria@intel.com> wrot=
e:
> There seems to be something wrong with cacao-initial-native JIT compiler =
that causes sporadic segfaults when compiling jamvm-native or classpath-nat=
ive. This is fairly rare, I estimate around 1% of the builds fail due to se=
gfault. I use 64 bit Ubuntu 15.04 with GCC 4.9.2 as build machine.

Did you check if cacao-staging tree does not include a fix for it?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


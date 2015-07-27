Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2BC601F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 15:31:14 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so54758424pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 08:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=/02m0jPKkX5u2v5Vrq99dV4MLZZWuVcSpffU9o9JNrE=;
	b=JfC+A3MCBCHgZLiNalM7CZmZLtqVZAnKzjsHLuKat0nWdWw08rsMwdj9wGCBYfj9Nj
	cHoLuklvsNfKMGfgrmn/ePL9F5pNwSUXdxJIoUnKfHFaQ8RzGxDo+wqoS/eNQst1IeME
	A6504SWdAqhUqeHSgJx2kAw07IAyQCQrMKHJHnFWhkoARbID7iNBRyzuIhcKZp84ZkAK
	pHJ5pVSERd5cxN0QKLOuHTFyGzeJP7H83oTVhB7lUSJ1BRKqPKG7vzLBepxXpYo1HDAz
	DotW4adj+xay3KR6eTthi9kXRvw39yV8I5pQitSpp++RyzC2FbspZKT2SebOER8K4oyY
	VCAA==
X-Gm-Message-State: ALoCoQmjj9vaDG2K9XQ9Zo+F3Ixnw7w3qAD5GkiZYt4AehpMc98Oh+MkbT57zK/jRobxXiTLEfCx
X-Received: by 10.70.133.170 with SMTP id pd10mr69243262pdb.127.1438011074957; 
	Mon, 27 Jul 2015 08:31:14 -0700 (PDT)
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com.
	[209.85.192.174]) by smtp.gmail.com with ESMTPSA id
	fv5sm30142526pdb.19.2015.07.27.08.31.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 08:31:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdbbh15 with SMTP id bh15so53828940pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 08:31:12 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.20.196 with SMTP id p4mr69490196pde.58.1438011072270;
	Mon, 27 Jul 2015 08:31:12 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Mon, 27 Jul 2015 08:31:12 -0700 (PDT)
In-Reply-To: <CY1PR0301MB0699C4D524869A626183ED30F78E0@CY1PR0301MB0699.namprd03.prod.outlook.com>
References: <CY1PR0301MB0699C4D524869A626183ED30F78E0@CY1PR0301MB0699.namprd03.prod.outlook.com>
Date: Mon, 27 Jul 2015 12:31:12 -0300
Message-ID: <CAP9ODKreAXzxtCMXD0USfJicVK2be4Dci0MDJbMVos0dXEUo2Q@mail.gmail.com>
To: Yu Zongchun <Zongchun.Yu@freescale.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	"akuser808@gmail.com" <akuser808@gmail.com>
Subject: Re: Require backport two patches to fido branch of meta-openembedded
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
X-List-Received-Date: Mon, 27 Jul 2015 15:31:18 -0000
Content-Type: text/plain; charset=UTF-8

Hello Martin,

On Mon, Jul 27, 2015 at 12:20 PM, Yu Zongchun <Zongchun.Yu@freescale.com> wrote:
> Can you help to backport the following two patches to fido branch of
> meta-openembedded?
>
> http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb?id=addfb0b786c90333a70873bb715d84c97412b3c9
>
> http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb?id=4a4b9d25db86111872c73daaa2116addfb3d26e1

Please backport the two commits above.

Thanks in advance,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


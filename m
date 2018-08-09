Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE1078DE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 07:53:58 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id q129-v6so3598870ywg.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Aug 2018 00:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Fs81mNdDPHImq0yfS15nNOFtyK2pTaBFVORrH8SbLpM=;
	b=m5TGu4XI6MExkwfDMFDAZNzaogUZy79ojpZX3f0hwCF+LGXHUVwfvRC35fgkJr1sEc
	w+QtB/AWgQ6F67BbSKMymhutpku5ftWTjbYqHemBtvgtG1spnDEOpZpeQAOVUNlQEcB3
	0+FP+aPP2wuGE9zp5gU3G/dYYhK9Y27bEeJMMrFjS23B1CybHowQx1pfTErVyWSdEezK
	KmKGJoahteLDJktXyLnVoDjoFbxh2XZqLQ7a0PsZDldtVUa2vK6EuoeFSrpPkG/glLVW
	hKdqY2hsbDp3nG3SGnsK+x5xl9rahsROAvgOOq9/i0VmUf+b3Z615+QkMiuYgowXN5FG
	4MIw==
X-Gm-Message-State: AOUpUlE21cAtMdlS9zKUXzXegK1NFcqkPPNyHLFeV61B6E+VxYF7DsP/
	V5ekDVfTH11eONtOlR/r9y86ew/2
X-Google-Smtp-Source: AA+uWPyL42mXSgHby8KOMhTeTmikgitXCW5+9dH1MZBeoPlHjwU9+XJ4B7NotSmKCrU+UeyOsJGEFw==
X-Received: by 2002:a81:1690:: with SMTP id
	138-v6mr475927yww.507.1533801239190; 
	Thu, 09 Aug 2018 00:53:59 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v129-v6sm2452486ywa.76.2018.08.09.00.53.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 00:53:58 -0700 (PDT)
Message-ID: <51c0ef3f90e70b80fef4b5de2a185f4a6b57e6fe.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Leitner <richard.leitner@skidata.com>, 
	openembedded-devel@lists.openembedded.org
Date: Thu, 09 Aug 2018 08:53:55 +0100
In-Reply-To: <adb7f3f5-cb65-cf96-be52-e02bb06428d8@skidata.com>
References: <20180727132923.15149-1-git@andred.net>
	<20180727132923.15149-5-git@andred.net>
	<adb7f3f5-cb65-cf96-be52-e02bb06428d8@skidata.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][RFC][PATCH 5/7] layer.conf: set defaults for Java JRE (R)PROVIDERS
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
X-List-Received-Date: Thu, 09 Aug 2018 07:53:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-08-02 at 12:49 +0200, Richard Leitner wrote:
> Hi André,
> 
> On 07/27/2018 03:29 PM, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > OpenJRE-8 seems like a good choice.
> 
> I'm not sure if OpenJRE-8 is the best choice as it currently doesn't
> support JIT for
> arm architectures...

Oh, thanks. I didn't realise that...

Anybody know why? Just nobody interested enough so far to integrate the
aarch32 hotspot port into meta-java?


Cheers,
Andre'



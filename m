Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 35AB065CE7
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Aug 2014 20:25:45 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id r10so7375449pdi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Aug 2014 13:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BeCf+iX7FE2Ukt07YxYKY8OKitqWIzYcyU+WYuNmFKU=;
	b=PSK4iRyyOIK4Pi/Ay9fTY8AGa6zzqSOXf04HKbZ6X6/ii8XBIIDpwinvM704kh2HGi
	G+HTYKZyPi9T8VTx2mIPCwWoRegDjD+uRN15ae66j5MjBEverPDRhNFRZWZe3hJrDq0f
	k8qJSpuq3KDAXNx7TbX5MvIeMkJZssG3Cy36cxwJsdsZbYaClAwfWxU9ChPB9aVn3tGJ
	K9X1qIlg+tkw6XARAJ76YFnc0jeaIddMdVTS+TKn07xEzpHn/3H/MUkpdgKs2CQUlGci
	gd/FMbc6hpRI2RoUPAhBzcNzV2+ksoxvb2u4DTSviXP7pcgALaukn40ETTUNotKR2ndQ
	VxRg==
X-Received: by 10.70.36.33 with SMTP id n1mr14339619pdj.26.1407011147004;
	Sat, 02 Aug 2014 13:25:47 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id
	fy1sm19113483pdb.66.2014.08.02.13.25.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Aug 2014 13:25:46 -0700 (PDT)
Date: Sat, 2 Aug 2014 13:29:08 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Nilesh Kokane <nilesh.kokane@mindastoneridge.com>
Message-ID: <20140802202908.GB23556@haswell>
References: <CAHURY+15jB-vQQakQSfjL7WsNjpQyQy6Nq-dcUVPKJ11SNWF7w@mail.gmail.com>
	<CAMKF1sqOXff9rN3OvfXYSZ+tGfqeWuwJjGRXXvgzo-0PsmjvUA@mail.gmail.com>
	<CAHURY+0bMeKK_xwUb=m6Q=pQkXp2bdbT=ErmC3EpCTiQ7VwjmQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHURY+0bMeKK_xwUb=m6Q=pQkXp2bdbT=ErmC3EpCTiQ7VwjmQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake meta-toolchain error
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
X-List-Received-Date: Sat, 02 Aug 2014 20:25:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 14-08-02 08:59:13, Nilesh Kokane wrote:
> where are the logs
> 
> I'm logged with the errors as posted on pastebin
> http://pastebin.com/hsMhT9f8
> 
> Please if you can have alook.

It seems eglvivante.h might have issues are you compiling
Qt with XCB support ?
then check if egl defines are OK in that header. 
you might delete all defines except X11 in eglvivante.h
may be that will help.



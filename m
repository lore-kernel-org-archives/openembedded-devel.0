Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 89F426D99E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 13:16:33 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id i7so16727557oag.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 05:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=YNUr/5/tNNabx3J4tL8mQAvFHrHsm/AreCE3IYc3yWs=;
	b=GadDP+lb+mRDxF1VhmU5VDxcRcXAE3q9nm2sYcWanhULUdQQoXN+pfUfdM57wAyzTe
	MUsi3bzOyfJToqT23X8ba+GEDcb59vJE/OnuFBttrmcnto0jjI71TA8bN8G+E7Na3J2b
	zaDRPQOroW4m/eYcR+So1XwZiF6wFoDlDUE/6lwEMi1T5Um7L/oK10n9ngqu+1UJB9Um
	vpBpywHTJtQjgWBHd4wz3paNyobdYbZBrZAMr1MSx4SoCarnKHuzc6N7dEgV1v9xDEvD
	Iq2gGsJ/tVUAkDIWGIyklCGdMBjsgL1JxkH8s81ldGVUQ3DLkpKjf/+NON/NDk8Bw/AH
	LXag==
MIME-Version: 1.0
X-Received: by 10.60.58.134 with SMTP id r6mr16810264oeq.17.1386162992319;
	Wed, 04 Dec 2013 05:16:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 4 Dec 2013 05:16:32 -0800 (PST)
In-Reply-To: <l7mogt$5cp$1@ger.gmane.org>
References: <1386107047-27409-1-git-send-email-otavio@ossystems.com.br>
	<1386107047-27409-2-git-send-email-otavio@ossystems.com.br>
	<l7mogt$5cp$1@ger.gmane.org>
Date: Wed, 4 Dec 2013 11:16:32 -0200
X-Google-Sender-Auth: -mKKsHXmy3cIugtj4y3mvj6WxVQ
Message-ID: <CAP9ODKpy+pLLboraV=nNeEB1i3oVdg=DarEmF9Mem+do4sGC9w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe 2/5] proj: Use 'lib_package' class and add data files
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
X-List-Received-Date: Wed, 04 Dec 2013 13:16:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Koen,

On Wed, Dec 4, 2013 at 6:20 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> -inherit autotools pkgconfig +inherit autotools pkgconfig lib_package
>>
>> +FILES_${PN} += "${datadir}/proj"
>
> Will this cause renaming of the output packages?

It does:

tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-bin_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-dbg_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-dev_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-doc_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj-staticdev_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk
tmp/deploy/ipk/cortexa9hf-vfp-neon/libproj0_4.8.0-r0.2_cortexa9hf-vfp-neon.ipk

Do you want me to add a transitional package?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


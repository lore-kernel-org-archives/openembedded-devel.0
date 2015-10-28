Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id C5A4671633
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 11:07:44 +0000 (UTC)
Received: by igbdj2 with SMTP id dj2so4207800igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 04:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=V5iQEF2Y5Df9bzh+Qpg5H5vGjTIazMCdLTmAjLCrrko=;
	b=Oj8LnWi3sO0ebJsvqNQbbyy5Yccl/VSGsIDu+b3WMCKtx6zKoV93R9qbHWwtrJXGBO
	4jug5K+/rivNbiGLf1VDEDcIsXHLw/lwN1ZBSb8w788JIhv6uUJLQBXGYUx4G6P5J5Bn
	bqheOCYE+dKG8b8wbx6vnFvhEPI3x1nRoqRZqkocer8Ht7T6X8O21B75/ZPZhT7GWJz9
	wYeLdqRVFJv9qNOmC63NryOtaee+Cdm3Orn/vHCMAbWD/LdHTBUSsh/hW1D2bioqm/a1
	eNhaLhn7jl0ztJhcuUs11soCjvKl7dECVvzgkOclj8dg0z1onSptLRIM65lV8piTmcY9
	aKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=V5iQEF2Y5Df9bzh+Qpg5H5vGjTIazMCdLTmAjLCrrko=;
	b=ZlxQSEoM0u2AYZAC9O2UMqUOyrFKHONm3+h3wTe9wqF14A/MlclK4+55UlFXI2MvDh
	4XAgDZKV7t5Pqe7Yd+HfSy3s+jJ721ZIuNtpEzEg7tpUpu26aS/wI+JpNQI4HufjADFg
	1bFJp9PKgv8XOumWsxSl55YJBKjTyytj34cIi+K1RVu8igZzJf0iqlBEG1U+q6ByQ24v
	Y9CyMDE0HtOoIliYVgQRFaDikavG1HSoqF4Sv+mWmzG6p//0SI8aU3NQG5GmypRp5twP
	vf8OaCWKJBbs8N4aPe2u9fCtfYdSl/B5AcfmudYjKbH96nEHZbMWvidIv7WdDeiDdzml
	Lheg==
X-Gm-Message-State: ALoCoQmGJK9Vh55i1tEuZcDsiiBunHhp+/PxKQbZeKi9MTkxvfF3VsQYYEJW/jkMERn1hYM/XH74
X-Received: by 10.50.67.148 with SMTP id n20mr2316064igt.65.1446030464404;
	Wed, 28 Oct 2015 04:07:44 -0700 (PDT)
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com.
	[209.85.213.181])
	by smtp.gmail.com with ESMTPSA id yq9sm9777985igb.6.2015.10.28.04.07.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 04:07:43 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbhv6 with SMTP id hv6so4248048igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 04:07:42 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.134.98 with SMTP id pj2mr2342903igb.46.1446030462584;
	Wed, 28 Oct 2015 04:07:42 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 28 Oct 2015 04:07:42 -0700 (PDT)
In-Reply-To: <1446018829-28181-1-git-send-email-richard.leitner@skidata.com>
References: <1446018829-28181-1-git-send-email-richard.leitner@skidata.com>
Date: Wed, 28 Oct 2015 09:07:42 -0200
Message-ID: <CAP9ODKoPj=PPV6nYW9DxGGHz7EkeeTq-ie6Gy28vz8qsj=B=rQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 1/2] README: remove instructions for OpenJDK6
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
X-List-Received-Date: Wed, 28 Oct 2015 11:07:45 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 28, 2015 at 5:53 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> Due to the fact OpenJDK6 was removed from meta-java, remove also its
> usage instructions from the README file.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Are you going to push it or should I do it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


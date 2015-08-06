Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 349A46E630
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 02:46:44 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so2957053igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 19:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=bybu7/GHsMyoOj3EgHLIPy+ut/izWS3nlmf8zXL2NiE=;
	b=VrUy4TiWq952fP69Rytcu5jY7ClwsJYu7mPJJPViTtRWVAGmI+DddeMpyJE4ZSdcpF
	QnF8kKQGRUsB2Gcn7Y7wGXRU5027UgObx6xxD5F32kNmdMaY026RNGwIXb0eaNkO3Wca
	qgoQAjfPhVLnI7hM8h8nC46p4rTHhfBjPKMPH8C/7Va3Odtn/gjt5UdeQc4xjauZDRxw
	8xv2ysujSSbF1Y6o3Z7QmJw+cU/tUx9EzaEuvw0lCsAqsc1l6Ni0Eqh97krRVxIrTqaO
	C7tbJiLMjyeugRpBBjP4RFiuBYv7EJYQo6+E6Krs1iOy7zmiIetJ8FI3gpGVOvFcg0Ee
	KjCA==
X-Received: by 10.50.30.196 with SMTP id u4mr978305igh.11.1438829204325; Wed,
	05 Aug 2015 19:46:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 5 Aug 2015 19:46:14 -0700 (PDT)
In-Reply-To: <20150805165605.GC2452@jama>
References: <1438571196-44094-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1438571196-44094-2-git-send-email-leimaohui@cn.fujitsu.com>
	<20150805165605.GC2452@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2015 19:46:14 -0700
Message-ID: <CAMKF1sr4ev0VaT5pmudOB_sfrcwKU_PCL8BhV1fPDY=niBCQkQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4 1/6] cmpi-bindings: add new recipe
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
X-List-Received-Date: Thu, 06 Aug 2015 02:46:45 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 9:56 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/include/python3.4m/pyport.h:814:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."

its accessing native sysroot for python platform detection. That
package needs to be tought to build for cross env.


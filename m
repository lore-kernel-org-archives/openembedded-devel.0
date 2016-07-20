Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id D2E12606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 20:16:19 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id u25so32624107qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 13:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4kUdUX54Wvjun7U3a0h8n+2wzPxmHbzilMHGKUw8H+A=;
	b=WZBnKJ7MtNyQb/LAfwxLrJH7p9NJSlgAE7Jt6DgGUIMVdq5L1LP3OUxvBj82DIXVCC
	JRBElht2wRpr/jHPbtIaAAPyjZC6uXz3afkxCsw22sc1Ab2Nh0zmg+e2dfUhee/78YeZ
	ABR7jwezlD8PuTnguOdkwSUJn3LabGSa7xaFaH20oZbGCgeqjupjqHhHGaLIcL8EhXDz
	M2dASo/Jx2lWNSUs5w7CrrJ588pk0Wttd+3oRXcHrxybuCoNwrPXiWbDnnfKKULNZjE3
	jo66EcElwdOcPujojoTu7PrzMxgHGwOevpBX/mNE4m0eIVGbj3S1AzlAyG7dWZWpXJ6z
	pvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4kUdUX54Wvjun7U3a0h8n+2wzPxmHbzilMHGKUw8H+A=;
	b=HcEcTofp/zAyb1vhgihtUABcb3OAtKRsjb5XUjuShTFU/pBgo6EhjTZv6VWDCuDwxs
	uEozZGbbh5Bsjqwk7YRbbemn3ClW/6/12panWLdeyazl9wAkjZFVs2DavVhT4calHJrg
	ZXu/ZcseQUGzfyutbylSBMnUJOaxfXTGhyQpw4Rt0+sofxmuRHB9KT9/r7fHm9tuJuoW
	Y604CRFQT1GSx/zSY0LtDEmwR3o9S/LRRsN9kU2uPIki9iNc9M1cX3IPIyMetN2ZMX+S
	34i92KrCx588rTA8y/oc3e9G9GDcepU+f8majHmPq4AkAPQTnFZRjb98iLz8289DXFSX
	uxAQ==
X-Gm-Message-State: ALyK8tINj14szRKy+QJ8AH+L3zl7Zw98D4HMcVCaQBa7Nr5Lga3NIlFbWlK23PhZRzVScw==
X-Received: by 10.237.35.146 with SMTP id j18mr46684604qtc.35.1469045779874;
	Wed, 20 Jul 2016 13:16:19 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	x42sm2331851qtc.29.2016.07.20.13.16.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 13:16:19 -0700 (PDT)
Date: Wed, 20 Jul 2016 16:16:53 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160720201653.GB23547@openSUSE-i7.site>
References: <20160720195201.22250-1-twoerner@gmail.com>
	<20160720195201.22250-4-twoerner@gmail.com>
	<CAMKF1spaOFPQz59rws-QSJ9v6hCFxWn1d93A9fx6yUuzFf6Q1w@mail.gmail.com>
	<CAMKF1spVuLDAQ13_2s+166pzpDghqeepkef_bejLtXuU=y324Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spVuLDAQ13_2s+166pzpDghqeepkef_bejLtXuU=y324Q@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-browser][PATCH 3/4] chromium: split into -wayland and -x11
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
X-List-Received-Date: Wed, 20 Jul 2016 20:16:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2016-07-20 @ 01:02:04 PM, Khem Raj wrote:
> On Wed, Jul 20, 2016 at 1:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > I would just leave chromium as it is (defaulting to x11)
> 
> meaning. chromium and chromium-wayland are names for  recipes.

Okay, sounds good.

I'll wait for more feedback and generate a V2 at some point.


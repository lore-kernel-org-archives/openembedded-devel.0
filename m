Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id C16357F7E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 23:00:15 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p26so2680339pfq.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to;
	bh=wT8KB7LYJ7l85drYuhK0oewtc4srvs9omyUFGPF6Eok=;
	b=uFiP3RjaJmAsi+GacrWs6dLAh7vluZNtwjUov4QH74B9AwEKD0cnmHsFBymSsvrs9z
	ZblUq4l1yDmwnLdwBBxK4f1UO6aZd+/37AanMWKu3AC8jmRxCBQ9Zs+9MmD2aAGTy1MF
	6cZvceGxtU9UcehxDWuqy7Ut6fr3bJPJe6j1B96unQOFzJoxqQpE9WW+ESUAWo55yjZY
	dR5STvszpLsVXvb3hwlhYAy0BgvGVsBd/aj2LqX8pcEhJhzlfB46mTdG/2xudW8rTKcK
	PA5gZF3ZjoCZU5WcgSPt8vrJkdZyNmIjoHHZh/MZ4crIliJ4bZ8Qf2VA6rcw7+2690J1
	7BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=wT8KB7LYJ7l85drYuhK0oewtc4srvs9omyUFGPF6Eok=;
	b=SOaLLTXpaDbev1H6x+iWTH4vcZ2ucU9aN4/oNX369eGWtUqon7RNdryaPoLG1QrLe9
	pxvXcFwysHdI3q6OVP1Jqc3b9WxUbOiWfb3R9/tR/d/43EeG1QiceTKuJlgx0WaeYdG/
	hSFmtXL24dNIOLCc/dIPLydRF9ibPUqYHi+e5VC8woAHHYgY/FEMFAuMVw6B7q1Wmt4+
	QnGsdRxKTjnQ5MwtZKgdZFtvlAWg0NAVEeSuPwpuu1fPKw+lntwHqNjYYbprobV7uDoU
	Ddx5sl5UpZXHcrrIRuOmVo51sCp1R/GYnWkKOyOqXK3wbvQ76A7u/voQa+RQwXR7Yowk
	OJdQ==
X-Gm-Message-State: APjAAAVoU+ePMx9yemWelIl/t2GRyjsTCqdnqQ8VdTM3rUGo8nIYCjt1
	aM/eCBF2g8556DwLl+M+dEbR5GWOQlQ=
X-Google-Smtp-Source: APXvYqwrEbNTZaG/nncsJtUIpfhExzTnZvk0WvnTi88f9NfacWmxREw/nbvczHgfuXgHkM8sHUArqA==
X-Received: by 2002:a63:2226:: with SMTP id i38mr6508278pgi.50.1573686016581; 
	Wed, 13 Nov 2019 15:00:16 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id j7sm3554250pjz.12.2019.11.13.15.00.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 15:00:15 -0800 (PST)
Date: Wed, 13 Nov 2019 15:00:06 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20191113230006.agszmoiphizjklvn@apollo.localdomain>
References: <20191106205407.18957-1-schnitzeltony@gmail.com>
	<CALbNGRSg5k3g5X02hYxuFhS+F_nktDOUU6VaXdD51-ud3kD0hQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSg5k3g5X02hYxuFhS+F_nktDOUU6VaXdD51-ud3kD0hQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] Add gnome help packages to image according to IMAGE_LINGUAS
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
X-List-Received-Date: Wed, 13 Nov 2019 23:00:15 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Nov 13, 2019 at 11:10:06PM +0100, Andreas Müller wrote:
> On Wed, Nov 6, 2019 at 9:54 PM Andreas Müller <schnitzeltony@gmail.com> wrote:
> >
> > In case
> >
> > * 'helpfiles' is in DISTRO_FEATURES and
> > * PACKAGE_NO_HELP_SPLIT is not set to '1'
> >
> > those help packages matching language selections in IMAGE_LINGUAS are added to
> > image automatically.
> >
> > For more details see:
> >
> > [1] https://github.com/openembedded/meta-openembedded/blob/master/meta-gnome/classes/gnome-help.bbclass
> > [2] https://github.com/openembedded/openembedded-core/commit/3a9e9585aeb67234901b2f842113dbe20c3801b3
> > ---
> >
> > v1 -> v2: Add IMAGE_LINGUAS_COMPLEMENTARY only if helpfiles is in DISTRO_FEATURES
> Ping?

thanks for reminder, It did not appear on patchwork and slipped through
my email cracks. Staged into master-next now

> 
> Andreas
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


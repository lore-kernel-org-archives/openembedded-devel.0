Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7267F7BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 22:10:16 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id x21so4440683ior.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 14:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=6ed0kuq2AHicyUSiuZveEUx2OL3mzyS3350gaZ2o31o=;
	b=UUctKAtQALQZsWkQh1czsSKiR7SMr6DRZRFcDmjjXdhgGcwtEb4Fu4qg2SG1dEhLkP
	jBgONXtoCovy48UYUMNHCb5iBZ+lsSjMhfdPBp6PGffTr9bE7azL8PwsQI69SUwBoGGa
	l0IMEma+inZ1cgVGYnp/wEf6F2565DQUvOHG9Vtxjw37bg0TelXakzKvujoDoPU2CoBl
	UqWPiNRjjcTCLdnfo/hGbxpQyr2/JGkUPfjIE0EYEc7n4Ws/giO9ZpOn2idcB5T1S4An
	cN9wYbaFqI8mz0jxPDK1lC65CMIhzM8tcJm/n9+ncmmz28FzK9VHRCgoIijoMQwes09k
	rrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=6ed0kuq2AHicyUSiuZveEUx2OL3mzyS3350gaZ2o31o=;
	b=EE5g1XcsqglbxQAxSidAEJiYpaYEIwkkgmcRWAD0HXFWLfWjvy+itDYJnWmXQQHmcq
	PiGeUJreP5CgMasuaYuLWqbQZinBhjMPvhHj6gX9z7o8nKP/V0oMJh2HEwhQsw+RhREe
	/l6Z/7dojue6TiNtKfkBqbn0ekWJRdbivgckt0GNSewo9RkVGK7tF1NU5Dl/+jghqhPo
	M964NuhYKfXfZzOf+ZTI3ML/L+CBf6UfdAJkUmaMmuJkxpMUzVZmhqXCopQUw/Ke7AYe
	1KaLFw2H4Y3PZbzGNApgnku7Ai3yUDtsWd9qc1Lly4WrJGFfdezb+VYxKZCjONqaXQdo
	Foqw==
X-Gm-Message-State: APjAAAXRoCacbM072VXeLM2UnJF1slO6RlF1l6FpYcKzWcqVxMmpKdHr
	bG9f2bc7mwi1gfjV8DpVYaudvQExvkssgmy0o2/CKg==
X-Google-Smtp-Source: APXvYqzfOkLKdGvv1Ou8y7vJWtsRgLl31Z/suuqFRIjBCxajaMo14NtXY33QxYTdD9PloyJL3+iAOTzNBt38RzSTLg4=
X-Received: by 2002:a02:a38b:: with SMTP id y11mr5024400jak.81.1573683017218; 
	Wed, 13 Nov 2019 14:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20191106205407.18957-1-schnitzeltony@gmail.com>
In-Reply-To: <20191106205407.18957-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 13 Nov 2019 23:10:06 +0100
Message-ID: <CALbNGRSg5k3g5X02hYxuFhS+F_nktDOUU6VaXdD51-ud3kD0hQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	zhengrq <zhengrq.fnst@cn.fujitsu.com>
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
X-List-Received-Date: Wed, 13 Nov 2019 22:10:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2019 at 9:54 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> In case
>
> * 'helpfiles' is in DISTRO_FEATURES and
> * PACKAGE_NO_HELP_SPLIT is not set to '1'
>
> those help packages matching language selections in IMAGE_LINGUAS are add=
ed to
> image automatically.
>
> For more details see:
>
> [1] https://github.com/openembedded/meta-openembedded/blob/master/meta-gn=
ome/classes/gnome-help.bbclass
> [2] https://github.com/openembedded/openembedded-core/commit/3a9e9585aeb6=
7234901b2f842113dbe20c3801b3
> ---
>
> v1 -> v2: Add IMAGE_LINGUAS_COMPLEMENTARY only if helpfiles is in DISTRO_=
FEATURES
Ping?

Andreas


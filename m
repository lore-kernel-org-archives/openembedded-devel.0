Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 48A157DD6A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 12:17:13 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id j13so40271908ioe.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 04:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=twb9rH8G63/vbutMpWwbxtXCyTu9WPqCYt7K5RZSzkc=;
	b=Itk0jVLDtQ1AFxA4UyneEvT+peF7AFWAzKuWV4Zl2yps1oFugX++NG0c8J9+I3WqMD
	/zMlQ8m5omTlJ70+nmxZYDqUt9YjqrsYfB/b6Ae8LI9DffGLkwWg9NQ/A5anK1vIjqAS
	RVsAewWqsVPfgTlnaUsiogT0/yvsY1oPudlvNx9iVPN4aLguDzwMLA4LZYNlmtcmbviV
	07UxVdfJCfSXMuLno8S75sw2VwhlP/IeckjdGq1UeS3crFh3k+Dz6I6WaGjFxrDKBrM1
	i+H5ied6rk4jW+CQPLDgIlkzucKEIzsMtFpoyeL4T0AyrMnsKk1vsEvo35TsO4KWBboS
	+SUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=twb9rH8G63/vbutMpWwbxtXCyTu9WPqCYt7K5RZSzkc=;
	b=OtuAvYaQhE/c2Yh1XShQirZUFiggTS2tTtaccsyNwznW9lVKjiGZ/8Rd8rZ87GqTD7
	4wzMTGdl+ePy/0iw4GbrIeCKO4ipyXXWp07xr/5muium9yX+nRBgXqnIimEvgmhGzuI0
	9hBrH6AP4Qys56sawEreSDGsUg17H6agFCWvEfypZrEwD+VvAVg1PiSn9fRXVBt19Miy
	RZpsuVf9J+65Rw1SFRESfDt21B8lnUDE8OorIRNkgIr8x4RdptD12BkFmZh9xHyxmNQ9
	6xdc9I+TfQvc4swuHJZovB0ARjJRYQ8SGKiLxv3c8EISb3VN5Q8PIZCfPdZr9158gd5Q
	n6Ww==
X-Gm-Message-State: APjAAAW8mZGUOqvZYG45NPjOShWFZmwMovjShfli/iKMq9y4tyOVOYgq
	qI60fpTLZxqo78jnrMIkpE7uudQPgsf4Bu78SHU=
X-Google-Smtp-Source: APXvYqxyVow9stzywAuM7kZGiZqUZmoYTnqqvxYtrx5DPFdLJcAeMj5y8NhO9pvjMJ/iXcXMrSZ2FSadPN1hryYp/wQ=
X-Received: by 2002:a5d:9ecc:: with SMTP id a12mr2891641ioe.267.1575289034297; 
	Mon, 02 Dec 2019 04:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20191127144116.18751-1-schnitzeltony@gmail.com>
	<4c895365-4d8a-ea0d-d56c-8d12f03d3241@gmail.com>
In-Reply-To: <4c895365-4d8a-ea0d-d56c-8d12f03d3241@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 2 Dec 2019 13:17:02 +0100
Message-ID: <CALbNGRTCYXNn3pPmYnHjJqsuuSh+FjvnCoBCZ_fLCvR24NF0ig@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [zeus][PATCH 1/2] networkmanager: Upgrade 1.18.2 -> 1.18.4
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
X-List-Received-Date: Mon, 02 Dec 2019 12:17:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2019 at 11:53 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 11/27/19 6:41 AM, Andreas M=C3=BCller wrote:
> > From: Adrian Bunk <bunk@stusta.de>
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit 1db745db41e31c61448743842104d92a61e7ddfb)
>
> Why?
>
> is this a bug fix only?
>
Did cherry-pick original patch which did not mention anything about
it. So yes it is a bugfix-only release. From [1]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
NetworkManager-1.18.4
Overview of changes since NetworkManager-1.18.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is a new stable release of NetworkManager.  Notable changes include:

* Improve handling of externally added policy routing rules and for rules
  that are taken over after a restart of NetworkManager service.
* Fix taking over OVS devices after restart of NetworkManager.
* Bugfix reapplying IP configuration while activating.
* Allow reapplying Wi-Fi profile when seen-bssids changes.
* Various other bugfixes for minor issues and memory leaks.
* Various build and test fixes.

[1] http://ftp.gnome.org/pub/gnome/sources/NetworkManager/1.18/NetworkManag=
er-1.18.4.news

Andreas


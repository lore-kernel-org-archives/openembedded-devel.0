Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id D614B77DCD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jun 2017 10:19:38 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id u19so65711071qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jun 2017 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XhA80dMnMW/Ol+mpRxwG/7sH/Uv/+yXutf3PTcgNGZU=;
	b=EasI52w0ayLYSl7VusCTYZ4RubxvZw0jeIz5/EyBAqUosPzjf7wfpfBrn8Kk3XXD/O
	3rzPvS8Ut6zajRvgw1WX+Vqi++HmgbIYksL2r0mFPyFKoev6c78/VSYbXXU1eYwuPNpR
	GCVV/341NX2Lb9/at1nPBWIHCBX40U06Fx6Q7JeubdhtGcsGI5okQKo1Z9KDW6BbX6CH
	55Pt4wfznIv6l2KTP4gtbkg+QglRXLZYp+HaFJqr3SG403r4yHcwXTPD+aTOQbUn3y6f
	nNMFIFihJ9G3KlIHApR8RDB23aWpjjo1FtN7NI80v/fMX5SK0EolojnrS9DrHY5kWNgx
	2zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XhA80dMnMW/Ol+mpRxwG/7sH/Uv/+yXutf3PTcgNGZU=;
	b=uO16SPKc0EHo3i4sUzRE7gI3r0AnUFv1i45ZvbOeLxA4x7XlPKxXxvc7XIQxqHbt9q
	JQK/VihkoFh3yi6G4EDA54WUO+O5iMTIpgr8sOvxwr5JLAMR3Rw1HppGrLgyYNesOyb0
	Vw7j/QrTGa3dmYbjLcO0ud99vTnuu0MyY3Y/gIGIsjPz0bXZk+JAOY1ugxN67ZJSyJHv
	oFhO8jIiOYmmbu25tlx7yeP7YmzUDNeBFyEnV8/91r+lvvTdcEafcriuNlcsVFu/X+/Y
	bdThlhjElM7wzsikRl8MEuRapxomOwEyeGTtJB84sVvhj7rLUWn7cy+I7SiiNSHIsSWU
	lnGA==
X-Gm-Message-State: AKS2vOxM2rV/7NRnshQnpTX4G61tJgSFK9XzRmzkY/LQCtJvUj8w0q3B
	TvVUGb/0UjX8hgWSP3Y5RNb9QQjkGMTP
X-Received: by 10.200.58.38 with SMTP id w35mr7599025qte.93.1496744379419;
	Tue, 06 Jun 2017 03:19:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 6 Jun 2017 03:19:18 -0700 (PDT)
In-Reply-To: <CABcZAN=FhaM122AR_mM+aHuP79CWZPbTyS5ON8uBTkeX-_Q7zg@mail.gmail.com>
References: <1496655970-1826-1-git-send-email-ross.burton@intel.com>
	<CABcZAN=FhaM122AR_mM+aHuP79CWZPbTyS5ON8uBTkeX-_Q7zg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jun 2017 11:19:18 +0100
Message-ID: <CAJTo0LZOtk5op9Nqtu8qYrG+BNTrdztE9SVXEZ5uuYUEF6eocA@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] meson: don't pass localedir
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
X-List-Received-Date: Tue, 06 Jun 2017 10:19:39 -0000
Content-Type: text/plain; charset="UTF-8"

On 5 June 2017 at 20:41, Christopher Larson <kergoth@gmail.com> wrote:

> Maybe we should think about renaming that variable for clarity.
>

Yes.  Not sure what to though.

Ross


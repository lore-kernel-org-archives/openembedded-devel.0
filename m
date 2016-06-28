Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 368D56FF6B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 14:50:04 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id a2so2075074lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 07:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=QWLvRoUlKg95N7XGqlfGsoja6mTXShaY0TudOhz/V0Y=;
	b=b6WyQQzZ+yKsb6RtWxR1eUUmKMmrlYQgwDpKuQPd2exGOF4YgFVbcRPOjPVe/GLOUn
	jBKCEovXdJo5K1wxTgpMNTSHhor7u4/xl8GwYhPWIbGdwW0fB+VssrQr5M+OWUKcW0wV
	rqCGWV2x0a2WLV5rqtoPHJAiQwqFS28C6JKDFfl792BbjCjeveJJvC6LBvGmcuPIC57O
	to/HRtaGICbXYdtnj7EWCWQoZgIEHgFR3bfZz0U4nBzlOpDoYufGeLarwGIohN9Ds8BF
	Xbq1vjRVB2scoJozwWBPJTiNeKse5HxJBgotQ9izaqqNTsSsXW4olOiaquG9l8qn45Pv
	vZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=QWLvRoUlKg95N7XGqlfGsoja6mTXShaY0TudOhz/V0Y=;
	b=A9sJByzHAwSdjxdV/3PZQ8ZtFJRXE8RB4kiLErwKK404oaqgQ1pKc2RalmkXKivPt2
	DdBTCSZ3zvGw/cXAi7fw2QvpuC+fyOROSbi+OSneSfRavobFj1DMZp/uMjg6JagED9+w
	919wnI0Lb9CwPODyteWIb+7i8r8ZuG5aCBmR/4io8y9ceFiKUVHEsss/nsE97T0AQi5q
	tFZdLQDMfQoedkXillU140iNSrP5JVrTNuWo3J82R+dwhP8zX0LwXDifjISgTY7Lx4ad
	mE1BX1BWpGe7vaMdtng1qHSqB31MhK5cO9Myksx2h6eZRtxEgGel0sbtBqqSGTgyW7KN
	3R4w==
X-Gm-Message-State: ALyK8tK1pUzVvwPS26yeMJH17087ttlb/dZxhaWfDl0PQdbmGoi3u8tc6IvAHmy+0mfrLeetZLx7ZNhQS5v7YQ==
X-Received: by 10.46.32.85 with SMTP id g82mr637605ljg.33.1467125403464; Tue,
	28 Jun 2016 07:50:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.23.39 with HTTP; Tue, 28 Jun 2016 07:50:02 -0700 (PDT)
In-Reply-To: <1467102993-4925-1-git-send-email-mingli.yu@windriver.com>
References: <1467102993-4925-1-git-send-email-mingli.yu@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 28 Jun 2016 07:50:02 -0700
Message-ID: <CANx9H-BhTnCumkT2gyhLarvEyh+TsOLfOw9qdvne-XHw1FSL=Q@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH]: update some python packages bb
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
X-List-Received-Date: Tue, 28 Jun 2016 14:50:06 -0000
Content-Type: text/plain; charset=UTF-8

The subject line is misleading, as you are actually adding recipes for
python-pbr and python-mock, not updating them.
Also, please make sure that EACH patch has [meta-python] in the subject
line, these patches are consumed by automated processes.

On Tue, Jun 28, 2016 at 1:36 AM, <mingli.yu@windriver.com> wrote:

> 1,
>   Remove pytest for python-mccabe to avoid dependency
>   on python-runner as only one file test_mccabe.py import
>   pytest and this test_mccabe.py file not install on
>   our target eventually.
>
> This is not the right direction to go in. If anything we need MORE testing
of recipes, not less. The solution is to add a python-pytest-runner recipe
to meet the dependency.


> 2, Add python-pbr bb file as python-mock depends on
>   python-pbr-native
>
> 3, Add python-pbr-native dependency for python-mock
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


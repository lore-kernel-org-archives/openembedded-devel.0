Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id B395D7F8E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 22:38:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id n15so12997422wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=V5xTufe4NPRDUk2r3Oat4YlD5cXh6Z7rssbOtyp+BfY=;
	b=Efm53YXwy1uc9q/U1VwNrKoUIbLpDAjcwlNXjwtw76g8u2Qbyt5VJseZXHqYV0+aS+
	NosQc7UJiD+f0BfgLzYm+uloqpgOQoOSa7PXCMlRXdDQapt8MLWeCRB73exwCLUOxj3n
	OBhIBpXjP1qiYdV74jR1gyo6s/eznIr6149hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=V5xTufe4NPRDUk2r3Oat4YlD5cXh6Z7rssbOtyp+BfY=;
	b=ts7TDlVBbV4n6zyRCvwgNrl6bqXT5AVprFoxXRKE7B1wUSMWEjHkPHXX2MZ14TcgkR
	WcE24BQhtGpsgspq+kZ7usQmlrtLV8r/Hi6qgC2pyvXrGxCxC5MclS5Y9iCb8uSKTkML
	PT4vypN0QpFnZh4yu0GOUdIssUdsKVbUdcQwZLk9QE+SYrPWmKGcvgA/I4LIhYeKfuZF
	cdbopmHJQ/zZSsuCjPFnBz7GtFX86lxSub3RXaqbtLE1LJ36lhrgFYfmyR7pyZ3s+VgX
	bG1XXVi9Vvu4O4WI0aN0n/GMLmjFlJ4O8l1KNJ83mugwsP4L/vczzYcukHv9Xx3NlB7p
	8vWQ==
X-Gm-Message-State: APjAAAVWRcVCboP6q2e7y4YFTCr7oYlVh4moqem7DMN0wF0nh765GKWd
	pxUKgawbndJ76a+QCh10nVYNpA==
X-Google-Smtp-Source: APXvYqxzomarpx6bgxgxwY5v5nxqA5/8tYhaZ3akYIKlatfgxogDNRv1nmqK41AjlHuxI8OpHwPP/w==
X-Received: by 2002:adf:e806:: with SMTP id o6mr777758wrm.139.1571870287394;
	Wed, 23 Oct 2019 15:38:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r81sm515582wme.16.2019.10.23.15.38.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 15:38:06 -0700 (PDT)
Message-ID: <74cfcc6194868f8afbf5c6e82b17283f4e9340ce.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Muminul Russell <misla011@fiu.edu>, 
	openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 23:38:05 +0100
In-Reply-To: <CAK=B8ybAAncCAZ_EAGiH6+u5-cYYKPAwfJhxTi0Gj6Q8JfeZrA@mail.gmail.com>
References: <CAK=B8ybAAncCAZ_EAGiH6+u5-cYYKPAwfJhxTi0Gj6Q8JfeZrA@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Build info in the spec file
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
X-List-Received-Date: Wed, 23 Oct 2019 22:38:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-23 at 14:00 -0700, Muminul Russell wrote:
> Hello Developers,
> 
> Yocto can generate spec file for rpm packaging. But that spec file
> does not have %build and %install macro. Is there any work done
> already to include those 2 macros? Or could you give me hints how can
> I do that?

OE uses its own cross building process. You can't encode that cross
building process into those macros. rpmbuild assumes native compiling.
People have tried and concluded its really not practical.

Think about the fact that even if you did have something there, the
original process used to run the build would be different. That means
two different code paths, one of which will probably end up with
different results and hence be broken.

So yes, I understand the desire but it really doesn't make sense.

Cheers,

Richard



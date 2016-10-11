Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id A231671A74
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 09:37:43 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id l13so98144555itl.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2016 02:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=6qV74Gpg0qB7H5iREHqn+8xjA8E50Z/smwiKIqpaNIU=;
	b=GPeTpuoUovEMgPSZGYDlZCaqsy/VCsEl9UyayiRLQBRP2WDF1lVz8H8vNUaBe+Bd1+
	adhXD3v3AhaYlJD8QcJqHc39L/08m4I0IRSCGCovq0kFqh28GeaFCQnYCriyTcEc80Gt
	ItKcTLXYCZUsUa67ImYtMWXwlOe7rMIBwRS7PmyyZhmajKcbXospX+mnbkoIYUQq4CBI
	9aSJzWUAg6tRqOoCE2mQYhhni4pAhQ3LKaNHL3EBo/qbF/vdRqmEwlsLPwYh1wphv/LS
	EgbSlYGDU1UYAhz6WmjUal+VsCIIsoN4Go4LrvqphBvoTNLWHJEeQoaR5DivACtgJIr/
	rKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=6qV74Gpg0qB7H5iREHqn+8xjA8E50Z/smwiKIqpaNIU=;
	b=l0Dg8Vy3SpHX82wnunODxTalmvLPdQJVM2d8fEeOWH7kgEO2a663+3cqsvKZ/QbXJQ
	z8GdtSe+Fj/6ILwCcV+FZATrJGuGOb/akZ5voizqBJkgC2LPt2aGUL/aboMR4rq8YXa3
	hxsRw7VfC3Nf3jnozYtjUMNevOxOeQ9SstqvhqMYKRnLcWyrPiQekz9UEFRwr6XWy5BS
	EuYAqwAkv6UL8AwOHFTS/oxua9eL7+6oICIz/AK3l7ZAhfYQF3zab3UE75G/kh0a9K+4
	2dI9UijRh6p55M1mhsu3bsMaRckOX6MFT7clxI/F1wBxoADQUuf0ldaT1Ea+Q9kL7Kcg
	WUUQ==
X-Gm-Message-State: AA6/9RltDxI5PFxByZl/h5XyoxfLwmBwuCvIis08W2O/HcjzxqXCwJRkEux3GuXd+vUl7KqL9IeAgXD273wwCzyG
X-Received: by 10.36.109.3 with SMTP id m3mr4613266itc.20.1476178664569; Tue,
	11 Oct 2016 02:37:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Tue, 11 Oct 2016 02:37:24 -0700 (PDT)
In-Reply-To: <20161011082443.GA2929@jama>
References: <1476117065-12316-1-git-send-email-ross.burton@intel.com>
	<20161011082443.GA2929@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Oct 2016 10:37:24 +0100
Message-ID: <CAJTo0Lb5nriNQHSdLKoi2xkyk3PWCvNfF3tCS-TwuM65XhO0Nw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-oe] opencv: fix packaging and install
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
X-List-Received-Date: Tue, 11 Oct 2016 09:37:45 -0000
Content-Type: text/plain; charset=UTF-8

On 11 October 2016 at 09:24, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Oct 10, 2016 at 05:31:05PM +0100, Ross Burton wrote:
> > The OpenCV*.cmake files and the static library should be in the
> opencv-dev
> > package, not opencv-apps.
>
> Why not PN-staticdev?
>

I've not actually used opencv but it appears that his static library isn't
a static form of the main libraries but an auxiliary library that only
comes in static form.

Ross


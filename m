Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GSERi-0003Il-DW
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Sep 2006 17:02:06 +0200
Received: by py-out-1112.google.com with SMTP id i75so2759208pye
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2006 07:57:17 -0700 (PDT)
Received: by 10.35.38.17 with SMTP id q17mr3216639pyj;
	Tue, 26 Sep 2006 07:57:16 -0700 (PDT)
Received: by 10.35.96.4 with HTTP; Tue, 26 Sep 2006 07:57:15 -0700 (PDT)
Message-ID: <74d0deb30609260757w5b4c2236nab1a8eafe527584e@mail.gmail.com>
Date: Tue, 26 Sep 2006 16:57:16 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <451948D7.6000904@adtelecom.es>
MIME-Version: 1.0
References: <45190D58.2020807@adtelecom.es>
	<1865823264.20060926150138@gmail.com> <451948D7.6000904@adtelecom.es>
Subject: Re: List of dependent packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 15:02:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/26/06, Joaquim Duran <joaquinduran@adtelecom.es> wrote:
> Hello,
>
> Thanks for your answer. This is closer that I was looking for.
>
> I've tested both options (--dry-run) and (--graphviz).
>
> Using the first one with bootstrap image, the following output has been
> shown (it shown that several packages should be used and I should choose
> one):
>
> OE Build Configuration:
> BB_VERSION     = "1.6.1"
> OE_REVISION    = "57f56983ed32783fae7cfa0440e1f3a7cfc2280c"
> TARGET_ARCH    = "arm"
> TARGET_OS      = "linux"
> MACHINE        = "colibri"
> DISTRO         = "colibrioe"
> DISTRO_VERSION = "1.0"
> TARGET_FPU     = ""
>
> NOTE: multiple providers are available (task-bootstrap-unionroot,
> task-bootstrap);
> NOTE: consider defining PREFERRED_PROVIDER_task-bootstrap
> NOTE: package bootstrap-image-1.0: started
> NOTE: package bootstrap-image-1.0: completed
> NOTE: build 200609261620: completed

I wonder if this NOTE should only be shown if there is no provider foo providing
foo itself. If there is, PREFERRED_PROVIDER_foo ?= "foo" would then have
to be set internally.
It looks like now, every time somebody decides to provide an alternative to
some existing package, everybody has to add PREFERRED_PROVIDER
entries for this or live with the NOTEs.

> The simple question is: how can I define
> PREFERRED_PROVIDER_task-bootstrap line the local.conf file?

PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"

regards
Philipp



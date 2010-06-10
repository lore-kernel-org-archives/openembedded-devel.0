Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OMoOt-0000kl-0k
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 22:30:55 +0200
Received: by pvc30 with SMTP id 30so156030pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 13:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=aHkgW7jeBONEflYmbjdztV0GH3rrsu+bNy6/tggbUdI=;
	b=P9chVSMCwY3ticNq4F483qXzmWSIljXo1fHO1jGK8JfJHwGtvxho6n5YmdWKvKWH96
	+YAwd/hFnOe82Afviy4tuurvyU+5w1UsTjVhKv8CtWxbUs9C7F+HEWzhCiQLyr9a+X5K
	RbnBL0R5OWx0dQ35qbXxxjqZpT3IbFtb+icLg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=cXJGMEk6OBi0Z1xsPTmLU7qiC9/ZX+nAmOUCCsd8UyD+imjG/2sc2uystoljmjP61E
	+zHLt2vozqAZ7qy+LeLk9QtyCDNGg90yRk/N8RIXzU8jm/2NAmWa2VHJfRrjDmu+hAWo
	0gJwT4VvZ14Lfeh4AtIvd66QUYUtnSoPbq6lo=
Received: by 10.142.207.12 with SMTP id e12mr524551wfg.32.1276200065279; Thu, 
	10 Jun 2010 13:01:05 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Thu, 10 Jun 2010 12:55:29 -0700 (PDT)
In-Reply-To: <1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com> 
	<1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Jun 2010 12:55:29 -0700
X-Google-Sender-Auth: ju6aaW9G47EMrIAlI5sdumSWfvw
Message-ID: <AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jun 2010 20:30:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 10, 2010 at 12:46 PM, Bernhard Reutner-Fischer <
rep.dot.nop@gmail.com> wrote:

> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>  recipes/busybox/busybox-config.inc |   28 +++++++++++++++++++++++++
>  recipes/busybox/busybox.inc        |   39
> +++++++++++++++++++++++++++++++++++-
>  2 files changed, 66 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/busybox/busybox-config.inc
>
> diff --git a/recipes/busybox/busybox-config.inc
> b/recipes/busybox/busybox-config.inc
> new file mode 100644
> index 0000000..26ccec4
> --- /dev/null
> +++ b/recipes/busybox/busybox-config.inc
> @@ -0,0 +1,28 @@
> +# internal helper
> +def busybox_cfg(feature, features, tokens, cnf, rem):
> +       if type(tokens) == type(""):
> +               tokens = [tokens]
> +       rem.extend(['/^[# ]*' + token + '[ =]/d' for token in tokens])
> +       if type(features) == type([]) and feature in features:
> +               cnf.extend([token + '=y' for token in tokens])
> +       else:
> +               cnf.extend(['# ' + token + ' is not set' for token in
> tokens])
> +# Map distro and machine features to config settings
> +def features_to_busybox_settings(d):
> +       cnf, rem = ([], [])
> +       distro_features = bb.data.getVar('DISTRO_FEATURES', d).split()
> +       machine_features = bb.data.getVar('MACHINE_FEATURES', d).split()
> +       busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IPV6', cnf,
> rem)
> +       busybox_cfg('largefile', distro_features, 'CONFIG_LFS', cnf, rem)
> +       busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf,
> rem)
> +       busybox_cfg('ipv4', distro_features,
> 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
> +       busybox_cfg('ipv6', distro_features,
> 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
>

Should this (ipv6 at least) use COMBINED_FEATURES, since it requires
kernel/machine support for it to be useful, along with distro support?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


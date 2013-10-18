Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id BED536CBD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:51:16 +0000 (UTC)
Message-ID: <5260F68B.6090403@communistcode.co.uk>
Date: Fri, 18 Oct 2013 09:51:23 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1382081248-6370-1-git-send-email-olof.johansson@axis.com>
In-Reply-To: <1382081248-6370-1-git-send-email-olof.johansson@axis.com>
Subject: Re: [meta-oe][PATCH] rsyslog: fix dependency name (json-c => libjson)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2013 08:51:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 18/10/13 08:27, Olof Johansson wrote:
> Signed-off-by: Olof Johansson <olof.johansson@axis.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> index 0101004..238b484 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
> -DEPENDS = "zlib libestr json-c"
> +DEPENDS = "zlib libestr libjson"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>  HOMEPAGE = "http://www.rsyslog.com/"
>  LICENSE = "GPLv3"
> 

Hi Olof,

The rsyslogd patches shouldn't really have gone in yet... I've fired off
a patch to oe-core to update libjson to the now named json-c, so if we
could hold off for a few days that would be great. Otherwise, maybe
temporarily revert the rsyslogd patches?

Cheers,

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 


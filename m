Return-Path: <ml@communistcode.co.uk>
Received: from euronet.mzplanet.com (mzplanet.com [91.82.101.45])
	by mail.openembedded.org (Postfix) with ESMTP id 591DB6A463
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 10:49:30 +0000 (UTC)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by euronet.mzplanet.com (Postfix) with ESMTPS id B754CCE1B08
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 10:49:28 +0000 (UTC)
Received: from localhost ([127.0.0.1]:36039 helo=owm.eumx.net)
	by owm.eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1VjRpA-0000Tn-Fi
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Nov 2013 10:49:28 +0000
Received: from cbnluk-gw0.cambridgebroadband.com ([212.44.17.78]:42785
	helo=[10.0.0.72])
	by owm.eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1VjRpA-0000Tk-D6 for openembedded-devel@lists.openembedded.org;
	Thu, 21 Nov 2013 10:49:28 +0000
Message-ID: <528DE53B.202@communistcode.co.uk>
Date: Thu, 21 Nov 2013 10:49:31 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1385028253-13293-1-git-send-email-olof.johansson@axis.com>
In-Reply-To: <1385028253-13293-1-git-send-email-olof.johansson@axis.com>
Subject: Re: [meta-oe][PATCH] rsyslog: rename libjson to json-c in DEPENDS
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
X-List-Received-Date: Thu, 21 Nov 2013 10:49:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 21/11/13 10:04, Olof Johansson wrote:
> The libjson recipe was renamed to json-c in commit 533c1db2 of oe-core.
> 
> Signed-off-by: Olof Johansson <olof.johansson@axis.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> index 238b484..0101004 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
> -DEPENDS = "zlib libestr libjson"
> +DEPENDS = "zlib libestr json-c"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>  HOMEPAGE = "http://www.rsyslog.com/"
>  LICENSE = "GPLv3"
> 

Cheers Olof, it was a longer haul than I anticipated trying to get that
recipe in!

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 


Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id B06C360024
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 10:12:20 +0000 (UTC)
Message-ID: <54CA078D.5070702@communistcode.co.uk>
Date: Thu, 29 Jan 2015 10:12:29 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1422517574-31477-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1422517574-31477-1-git-send-email-jackie.huang@windriver.com>
Subject: Re: [meta-oe][PATCH] rsyslog: don't call init script in logrotate conf file
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
X-List-Received-Date: Thu, 29 Jan 2015 10:12:23 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 29/01/15 07:46, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> Send HUP signal instead of calling the reload command
> of init script in logrotate configure file, so that it
> also works when the init system is systemd.
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
> index ba1120a..94ec517 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
> @@ -9,7 +9,7 @@
>          delaycompress
>          compress
>          postrotate
> -		/etc/init.d/rsyslog reload 2> /dev/null || true
> +		/bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
>          endscript
>  }
>  
> @@ -34,6 +34,6 @@
>          delaycompress
>          sharedscripts
>          postrotate
> -		/etc/init.d/rsyslog reload 2> /dev/null || true
> +		/bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
>          endscript
>  }
> 

This is better than my approach to fixing this as it works with systemd
also. I would take this patch in favour of my

[PATCH] rsyslog: init file has been renamed, reflect in logrotate conf file

Ack from me.

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 


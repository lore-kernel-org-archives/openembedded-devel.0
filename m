Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 13ADA65E7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 09:46:14 +0000 (UTC)
Message-ID: <534E515D.5090702@communistcode.co.uk>
Date: Wed, 16 Apr 2014 10:46:05 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1397640676-27955-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1397640676-27955-1-git-send-email-jackie.huang@windriver.com>
Subject: Re: [meta-oe][PATCH] rsyslog: add status command and minor fixes for initscript
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
X-List-Received-Date: Wed, 16 Apr 2014 09:46:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 16/04/14 10:31, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> - add status command
> - remove the unsupported option:
>   rsyslogd: error: option -c is no longer supported - ignored
> - add --oknodo for do_start
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-extended/rsyslog/rsyslog/initscript    |   35 ++++++++++++++++++--
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript b/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
> index 8dee684..4121434 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/initscript
> @@ -9,7 +9,8 @@ PATH=/sbin:/usr/sbin:/bin:/usr/bin
>  NAME=rsyslog
>  RSYSLOGD=rsyslogd
>  RSYSLOGD_BIN=/usr/sbin/rsyslogd
> -RSYSLOGD_OPTIONS="-c5"
> +# with rsyslog 7, -c is no longer supported
> +RSYSLOGD_OPTIONS=""
>  RSYSLOGD_PIDFILE=/var/run/rsyslogd.pid
>  SCRIPTNAME=/etc/init.d/$NAME
>  # Exit if the package is not installed
> @@ -27,7 +28,10 @@ do_start()
>          # Return
>          #   0 if daemon has been started
>          #   1 if daemon could not be started
> -        start-stop-daemon -S --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS || return 1
> +        #   if daemon had already been started, start-stop-daemon will return 1
> +        #   so add -o/--oknodo(if nothing is done, exit 0)
> +        start-stop-daemon -S --quiet --pidfile $PIDFILE --exec $DAEMON \
> +                             --oknodo -- $DAEMON_ARGS || return 1
>  }
>  #
>  # Function that stops the daemon/service
> @@ -56,6 +60,20 @@ do_reload() {
>          start-stop-daemon -K --signal HUP --quiet --pidfile $PIDFILE --name $NAME
>          return 0
>  }
> +
> +do_status() {
> +        NAME=$1
> +        PIDFILE=$2
> +        # -t: test only but not stop
> +        start-stop-daemon -K -t --quiet --pidfile $PIDFILE --name $NAME
> +        # exit with status 0 if process is found
> +        if [ "$?" = "0" ]; then
> +                return 0
> +        else
> +                return 1
> +        fi
> +}
> +
>  case "$1" in
>    start)
>          echo -n "starting $RSYSLOGD ... "
> @@ -82,8 +100,19 @@ case "$1" in
>          $0 stop
>          $0 start
>          ;;
> +  status)
> +        echo -n "status $RSYSLOGD ... "
> +        do_status "$RSYSLOGD" "$RSYSLOGD_PIDFILE"
> +        if [ "$?" = "0" ]; then
> +                echo "running"
> +                exit 0        
> +        else
> +                echo "stopped"
> +                exit 1        
> +        fi
> +        ;;
>    *)
> -        echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload}" >&2
> +        echo "Usage: $SCRIPTNAME {start|stop|status|restart|reload|force-reload}" >&2
>          exit 3
>          ;;
>  esac
> 


Hi Jackie,

I have a patch pending that fixes the rsyslog unsupported option. I
don't know if you want to take that and re-spin a v2 otherwise the patch
will probably fail to apply.

Cheers,

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 


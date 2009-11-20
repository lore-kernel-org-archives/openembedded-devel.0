Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NBSXu-0004nd-1Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 13:25:05 +0100
Received: (qmail 14643 invoked by uid 1003); 20 Nov 2009 12:23:35 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 20 Nov 2009 12:23:35 -0000
Message-ID: <4B068A46.8090701@balister.org>
Date: Fri, 20 Nov 2009 07:23:34 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911200514430.18485@localhost>
In-Reply-To: <alpine.LFD.2.00.0911200514430.18485@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Upgrade guile from 1.8.6 to 1.8.7.
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
X-List-Received-Date: Fri, 20 Nov 2009 12:25:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I applied this. A couple of comments for the future:

1) Make the commit message "guile: Upgrade from 1.8.6 to 1.8.7" for 
consistency.

2) You can include the checksums in the recipe now. See:

http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/curl/curl_7.19.7.bb

look in the curl-common.inc file for the "tarball" naming.

Thanks,

Philip

On 11/20/2009 05:16 AM, Robert P. J. Day wrote:
>
> Signed-off-by: Robert P. J. Day<rpjday@crashcourse.ca>
>
> ---
>
>    bitbake tested on x86_64.
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index b2bc05b..5529b73 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -11426,6 +11426,10 @@ sha256=e2f63d2d445ffeb072638eab885b1a629e372d1db711c8afb26a62bc56096289
>   md5=9e23d3dbea0e89bab8a9acc6880150de
>   sha256=69a2f9491480ff756d1cc4c8ea2bdc13d40ea8ddc8f93f26957bade8219a1d86
>
> +[http://ftp.gnu.org/pub/gnu/guile/guile-1.8.7.tar.gz]
> +md5=991b5b3efcbbc3f7507d05bc42f80a5e
> +sha256=bfee6339d91955a637e7f541d96f5b1d53271b42bb4a37b8867d186a6c66f0b3
> +
>   [http://gupnp.org/sources/gupnp/gupnp-0.12.2.tar.gz]
>   md5=5350f5f28fb3742779702a496ab75d72
>   sha256=9e4edb3ca6d11e397d9f98537fa8954851dc044d13ecafd4f4547117cefbdd28
> diff --git a/recipes/guile/guile-native_1.8.7.bb b/recipes/guile/guile-native_1.8.7.bb
> new file mode 100644
> index 0000000..2f87c48
> --- /dev/null
> +++ b/recipes/guile/guile-native_1.8.7.bb
> @@ -0,0 +1,5 @@
> +require guile-native.inc
> +SRC_URI = "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
> +           file://configure-fix.patch;patch=1 \
> +           file://cpp-linemarkers.patch;patch=1 \
> +          "
> diff --git a/recipes/guile/guile_1.8.7.bb b/recipes/guile/guile_1.8.7.bb
> new file mode 100644
> index 0000000..6889f33
> --- /dev/null
> +++ b/recipes/guile/guile_1.8.7.bb
> @@ -0,0 +1,6 @@
> +require guile.inc
> +
> +SRC_URI = "http://ftp.gnu.org/pub/gnu/guile/guile-${PV}.tar.gz \
> +           file://configure-fix.patch;patch=1 \
> +          "
> +
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



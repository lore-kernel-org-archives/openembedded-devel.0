Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PYNhl-0007Y6-6E
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 19:58:29 +0100
Received: (qmail 2147 invoked by uid 503); 30 Dec 2010 18:40:44 -0000
Received: from b9.ovh.net (HELO mail413.ha.ovh.net) (213.186.33.59)
	by 64.mail-out.ovh.net with SMTP; 30 Dec 2010 18:40:44 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Dec 2010 20:58:13 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 30 Dec 2010 20:58:11 +0200
Message-ID: <4D1CD643.8070702@eukrea.com>
Date: Thu, 30 Dec 2010 19:58:11 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293575359.19557.0.camel@mattotaupa>
In-Reply-To: <1293575359.19557.0.camel@mattotaupa>
X-Ovh-Tracer-Id: 15439183949687532873
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH] glib-2.0_2.26.1: remove `DEFAULT_PREFERENCE = "-1"`
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
X-List-Received-Date: Thu, 30 Dec 2010 18:58:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/12/2010 23:29, Paul Menzel wrote:
> Date: Sat, 25 Dec 2010 20:09:34 +0100
>
> Since commit 07d94e [1] (upstream 2729be [2]) task `configure` of `libfso-glib` fails with the following error, since GLib 2.26 is needed and Minimal and Minimal uClibc just provide GLib 2.24 since `glib-2.0_2.26.1.bb` has `DEFAULT_PREFERENCE = "-1"` set.
>
> 	checking pkg-config is at least version 0.9.0... yes
> 	checking for VALA_DBUS_BINDING_TOOL... yes
> 	checking for SPECS... yes
> 	checking for DEPS... configure: error: Package requirements (glib-2.0>= 2.26.0
> 		      gobject-2.0>= 2.26.0
> 		      gio-2.0>= 2.26.0
> 		      gthread-2.0>= 2.26.0) were not met:
>
> 	Requested 'glib-2.0>= 2.26.0' but version of GLib is 2.24.1
> 	Requested 'gobject-2.0>= 2.26.0' but version of GObject is 2.24.1
> 	Requested 'gio-2.0>= 2.26.0' but version of GIO is 2.24.1
> 	Requested 'gthread-2.0>= 2.26.0' but version of GThread is 2.24.1
>
> 	Consider adjusting the PKG_CONFIG_PATH environment variable if you
> 	installed software in a non-standard prefix.
>
> 	Alternatively, you may set the environment variables DEPS_CFLAGS
> 	and DEPS_LIBS to avoid the need to call pkg-config.
> 	See the pkg-config man page for more details.
>
> 	ERROR: Function do_configure failed
>
> Other packages from the freesmartphone.org API reference implementation will also require GLib 2.26 in the future.
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?h=org.openembedded.dev&id=07d94ebc8fd3d21fa83fb13fdf511ac008c316e6
> [2] http://git.freesmartphone.org/?p=libfso-glib.git;a=commit;h=2729be7c82a676455f93d201b0d0255ad7e139ba
> [3] http://git.freesmartphone.org/?p=cornucopia.git;a=commit;h=709ef63eab6eb9736c15e6731a50de4ccbb3613c
>
> Signed-off-by: Paul Menzel<paulepanter@users.sourceforge.net>
Acked-by: Eric Bénard <eric@eukrea.com>
> ---
>   recipes/glib-2.0/glib-2.0_2.26.1.bb |    2 --
>   1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/glib-2.0/glib-2.0_2.26.1.bb b/recipes/glib-2.0/glib-2.0_2.26.1.bb
> index ded471b..1c855e2 100644
> --- a/recipes/glib-2.0/glib-2.0_2.26.1.bb
> +++ b/recipes/glib-2.0/glib-2.0_2.26.1.bb
> @@ -29,8 +29,6 @@ inherit autotools gettext
>
>   S = "${WORKDIR}/glib-${PV}"
>
> -DEFAULT_PREFERENCE = "-1"
> -
>   EXTRA_OECONF = "--disable-debug "
>
>   # Add and entry for your favourite arch if your (g)libc has a sane printf
>
>



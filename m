Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RwClw-0001yp-KU
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 14:13:48 +0100
Received: by eekd41 with SMTP id d41so1023292eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Feb 2012 05:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=bQpvUpr9NYWJ0B7mBLQVSNVMBivDycM61So7uglohm8=;
	b=vrQPScCKRAWo5cZOr22AWHLMzlSty55iw+ZkjoiU3iryCquUVDhmtgLTJ4Vq5vmlVF
	nQNDzilOnatiiqGeAjOEvlav2OeWv+MelCzHZY46mPeSjbojMB3eRPM81Fr92uHIBeZU
	UV3dBKWRB/WSaaG/0ztmnUz58d8OgKgjPxDVk=
MIME-Version: 1.0
Received: by 10.14.52.17 with SMTP id d17mr3139086eec.56.1328965541800; Sat,
	11 Feb 2012 05:05:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Sat, 11 Feb 2012 05:05:41 -0800 (PST)
In-Reply-To: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
Date: Sat, 11 Feb 2012 11:05:41 -0200
X-Google-Sender-Auth: 0O5VnBd2DhEpM9GTXMroxZsw-FU
Message-ID: <CAP9ODKrMPr+HebN0fxNAOQ_h-iadrr82op0rDrE==CSOeSsa+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe 1/7] systemd-systemctl-native: add multiple services support
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
X-List-Received-Date: Sat, 11 Feb 2012 13:13:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Fri, Feb 10, 2012 at 23:59, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Thanks to Otavio Salvador for helping hint [1]
>
> [1]
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-February/037=
856.html
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../systemd/systemd-systemctl-native/systemctl     |   75
> +++++++++++---------
>  1 files changed, 42 insertions(+), 33 deletions(-)
>
> diff --git
> a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
> b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
> index 54c1a18..72b9da3 100755
> --- a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
> +++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
> @@ -10,50 +10,59 @@ while [ $# !=3D 0 ]; do
>                enable)
>                        shift
>
> -                       service=3D"$1"
> +                       services=3D"$1"
> +                       in_enable=3D"1"
>                        shift
>                        ;;
>                --root=3D*)
>                        ROOT=3D${opt##--root=3D}
> +                       in_enable=3D"0"
>                        shift
>                        ;;
>                *)
> -                       echo "'$opt' is an unkown option; exiting with
> error"
> -                       exit 1
> +                       if [ "$in_enable" =3D "1" ]; then
> +                               services=3D"$services $opt"
> +                               shift
> +                       else
> +                               echo "'$opt' is an unkown option; exiting
> with error"
> +                               exit 1
> +                       fi
>                        ;;
>        esac
>  done
>
> -# find service file
> -for p in $ROOT/etc/systemd/system \
> -         $ROOT/lib/systemd/system \
> -         $ROOT/usr/lib/systemd/system; do
> -       if [ -e $p/$service ]; then
> -               service_file=3D$p/$service
> -               service_file=3D${service_file##$ROOT}
> +for service in "$services"; do
> +       # find service file
> +       for p in $ROOT/etc/systemd/system \
> +                $ROOT/lib/systemd/system \
> +                $ROOT/usr/lib/systemd/system; do
> +               if [ -e $p/$service ]; then
> +                       service_file=3D$p/$service
> +                       service_file=3D${service_file##$ROOT}
> +               fi
> +       done
> +       if [ -z "$service_file" ]; then
> +               echo "'$service' couldn't be found; exiting with error"
> +               exit 1
>        fi
> -done
> -if [ -z "$service_file" ]; then
> -       echo "'$service' couldn't be found; exiting with error"
> -       exit 1
> -fi
> -
> -# create the required symbolic links
> -wanted_by=3D$(grep WantedBy $ROOT/$service_file \
> -                | sed 's,WantedBy=3D,,g' \
> -                | tr ',' '\n' \
> -                | grep '\.target$')
> -
> -for r in $wanted_by; do
> -       mkdir -p $ROOT/etc/systemd/system/$r.wants
> -       ln -s $service_file $ROOT/etc/systemd/system/$r.wants
> -       echo "Enabled $service for $wanted_by."
> -done
>
> -# call us for the other required scripts
> -also=3D$(grep Also $ROOT/$service_file \
> -           | sed 's,Also=3D,,g' \
> -           | tr ',' '\n')
> -for a in $also; do
> -       $0 --root=3D$ROOT enable $a
> +       # create the required symbolic links
> +       wanted_by=3D$(grep WantedBy $ROOT/$service_file \
> +                       | sed 's,WantedBy=3D,,g' \
> +                       | tr ',' '\n' \
> +                       | grep '\.target$')
> +
> +       for r in $wanted_by; do
> +               mkdir -p $ROOT/etc/systemd/system/$r.wants
> +               ln -s $service_file $ROOT/etc/systemd/system/$r.wants
> +               echo "Enabled $service for $wanted_by."
> +       done
> +
> +       # call us for the other required scripts
> +       also=3D$(grep Also $ROOT/$service_file \
> +                  | sed 's,Also=3D,,g' \
> +                  | tr ',' '\n')
> +       for a in $also; do
> +               $0 --root=3D$ROOT enable $a
> +       done
>  done
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


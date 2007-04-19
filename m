Received: from [64.233.162.226] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1HeaZe-0005XD-Kb
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2007 19:37:38 +0200
Received: by nz-out-0506.google.com with SMTP id m22so494232nzf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Apr 2007 10:37:37 -0700 (PDT)
Received: by 10.115.47.1 with SMTP id z1mr877435waj.1177004257034;
	Thu, 19 Apr 2007 10:37:37 -0700 (PDT)
Received: by 10.115.92.3 with HTTP; Thu, 19 Apr 2007 10:37:36 -0700 (PDT)
Message-ID: <432beae0704191037h28e548d1ib986be6f6f510063@mail.gmail.com>
Date: Thu, 19 Apr 2007 10:37:36 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <20070419014949.GA6540@twibble.org>
MIME-Version: 1.0
References: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
	<20070418090235.GA21841@twibble.org>
	<46262A0F.1050805@dominion.kabel.utwente.nl>
	<20070419014949.GA6540@twibble.org>
Subject: Re: Making /var/lib persistent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2007 17:37:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/18/07, Jamie Lenehan <lenehan@twibble.org> wrote:
> On Wed, Apr 18, 2007 at 07:24:15AM -0700, Koen Kooi wrote:
> [...]
> > Sound like a good idea, do you have a patch for this?
>
> Try this out:
>
>   http://twibble.org/dist/oe/var-volatiles-1.patch
>

I suggest attaching this patch to a bug in the bug tracker
(bugs.openembedded.org).

> I've tested it locally both with and without tmpfs mounted on
> /var/volatile and all seems to work as expected.
>
> I modified the base-files recipe to create the /var/volatile
> directory and the various subdirectories in it and to create symlinks
> from /var for those directories. This means that even if your not
> using tmpfs these will still point into the volatile directory. It
> was rather difficult to make it wotk without doing this.
>
> So on the target I end up with this:
>
>   root@titan:/$ find /var -exec ls -ld {} \;
>   drwxr-xr-x    7 root     root          288 Apr 19  2007 /var
>   drwxr-xr-x    4 root     root           96 Apr 19  2007 /var/lib
>   drwxr-xr-x    2 root     root          168 Apr 19  2007 /var/lib/ipkg
>   -rw-r--r--    1 root     root       196192 Apr 19  2007 /var/lib/ipkg/nynaeve-titan
>   -rw-r--r--    1 root     root        14408 Apr 19  2007 /var/lib/ipkg/nynaeve-all
>   -rw-r--r--    1 root     root      2670761 Apr 19  2007 /var/lib/ipkg/nynaeve-sh4
>   drwxr-xr-x    2 root     root           48 Apr 19  2007 /var/lib/misc
>   lrwxrwxrwx    1 root     root           12 Apr 19  2007 /var/log -> volatile/log
>   lrwxrwxrwx    1 root     root           12 Apr 19  2007 /var/run -> volatile/run
>   lrwxrwxrwx    1 root     root           17 Apr 19  2007 /var/tmp -> volatile/tmp
>   lrwxrwxrwx    1 root     root           13 Apr 19  2007 /var/lock -> volatile/lock
>   lrwxrwxrwx    1 root     root           14 Apr 19  2007 /var/cache -> volatile/cache
>   drwxr-sr-x    2 root     root           48 Apr 19  2007 /var/local
>   drwxr-xr-x    2 root     root           48 Apr 19  2007 /var/spool
>   drwxr-xr-x    2 root     root           48 Apr 19  2007 /var/backups
>   drwxr-xr-x    7 root     root          140 Jan  1 00:32 /var/volatile
>   drwxrwxrwt    2 root     root           40 Jan  1 00:32 /var/volatile/tmp
>   drwxr-xr-x    2 root     root           60 Jan  1 00:32 /var/volatile/run
>   -rw-rw-r--    1 root     root            0 Jan  1 00:33 /var/volatile/run/utmp
>   drwxr-xr-x    2 root     root           60 Jan  1 00:32 /var/volatile/log
>   -rw-rw-r--    1 root     root            0 Jan  1 00:33 /var/volatile/log/wtmp
>   drwxrwxrwt    3 root     root           60 Jan  1 00:32 /var/volatile/lock
>   drwxr-xr-x    2 root     root           40 Jan  1 00:32 /var/volatile/lock/subsys
>   drwxr-xr-x    2 root     root           40 Jan  1 00:32 /var/volatile/cache
>   root@titan:/$ mount | grep var
>   tmpfs on /var/volatile type tmpfs (rw)
>   root@titan:/$
>
> --
>  Jamie Lenehan <lenehan@twibble.org>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
Justin Patrin



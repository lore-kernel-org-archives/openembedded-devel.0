Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JmkWz-00075O-Ic
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Apr 2008 08:57:10 +0200
Received: by wa-out-1112.google.com with SMTP id l24so644105waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2008 23:57:07 -0700 (PDT)
Received: by 10.114.53.1 with SMTP id b1mr2212124waa.165.1208501827125;
	Thu, 17 Apr 2008 23:57:07 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Thu, 17 Apr 2008 23:57:07 -0700 (PDT)
Message-ID: <19c1b8a90804172357r753c3683rbc015abc9268212b@mail.gmail.com>
Date: Thu, 17 Apr 2008 23:57:07 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48081A44.4000008@gmail.com>
MIME-Version: 1.0
References: <1208473504.21779.3.camel@isis> <48081A44.4000008@gmail.com>
Subject: Re: patch base-files /etc/profile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Apr 2008 06:57:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Apr 17, 2008 at 8:49 PM, Junqian Gordon Xu <xjqian@gmail.com> wrote:
> On 04/17/2008 06:05 PM, Khem Raj wrote:
>  > Hi
>  >
>  > I was seeing that on Angstrom.2008 I was not getting TSLIB_TSDEVICE
>  > environment variable set though it should be as it was
>  > invoking /etc/profile.d/tslib.sh in /etc/profile. However the 'ls'
>  > command in there was not really working well.
>  >
>  > This patch fixes the problem. Now I see TALIB_TSDEVICE variable set
>  > everytime.
>  >
>  > OK for .dev ?
>  >
>  > Thanks
>  >
>  > -Khem
>
> > ============================================================
>  > --- packages/base-files/base-files/profile
>  > c1afd65b969f708eab144ec909358f3c8f22a411
>  > +++ packages/base-files/base-files/profile
>  > e24b90b96edb24d3af735f32c72528e6a01d617d
>  > @@ -20,8 +20,10 @@ if [ -d /etc/profile.d ]; then
>  >  fi
>  >
>  >  if [ -d /etc/profile.d ]; then
>  > -  for i in `ls /etc/profile.d/`; do
>  > -    . /etc/profile.d/$i
>  > +  for i in /etc/profile.d/*.sh; do
>  > +    if [ -r $i ]; then
>  > +      . $i
>  > +    fi
>  >    done
>  >    unset i
>  >  fi
>
>  looks good to me, but why not keep the absolute path:
>
>  . /etc/profile.d/$i

Its already in $i

>
>  Regards
>  Gordon
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



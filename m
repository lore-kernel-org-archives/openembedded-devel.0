Return-Path: <guy@guy-morand.ch>
Received: from smtp-sh2.infomaniak.ch (smtp-sh2.infomaniak.ch [128.65.195.6])
	by mail.openembedded.org (Postfix) with ESMTP id 507B56FFC8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 08:32:18 +0000 (UTC)
Received: from smtp5.infomaniak.ch (smtp5.infomaniak.ch [83.166.132.18])
	by smtp-sh.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v938WBVA009531
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 3 Oct 2017 10:32:16 +0200
Received: from [192.168.13.135] ([62.192.30.6]) (authenticated bits=0)
	by smtp5.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v938Vxum033041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 3 Oct 2017 10:32:05 +0200
To: Martin Jansa <martin.jansa@gmail.com>,
	Tim Orling <timothy.t.orling@linux.intel.com>
References: <1506673565-17289-1-git-send-email-guy@guy-morand.ch>
	<47BE632C-49AC-4509-9E45-A00124619DF5@linux.intel.com>
	<CA+chaQcTrzhT+2cQXwqxan7Nq6fM-K8YASJWTRXYAS7hEWEVhA@mail.gmail.com>
From: Guy Morand <guy@guy-morand.ch>
Message-ID: <315629b2-8e5e-c51a-64e5-b73855e3a142@guy-morand.ch>
Date: Tue, 3 Oct 2017 10:31:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcTrzhT+2cQXwqxan7Nq6fM-K8YASJWTRXYAS7hEWEVhA@mail.gmail.com>
X-Antivirus: Dr.Web (R) for Unix mail servers drweb plugin ver.6.0.2.8
X-Antivirus-Code: 0x100000
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] Add python pandas recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Oct 2017 08:32:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

Thanks for reviwing my patch, almost there! still learning community 
conventions :p!

My arguments for md5sums was if the PV changes, I guess both recipes 
will have to be updated. Since it's DRYer and other recipes are made 
this way, I will fix it!

"-s" never hurts!

I hope the third attempt will be the good one!

Regards,

Guy

On 10/01/2017 08:41 PM, Martin Jansa wrote:
> Also missing Signed-off-by line.
> 
> On Fri, Sep 29, 2017 at 7:37 PM, Tim Orling 
> <timothy.t.orling@linux.intel.com 
> <mailto:timothy.t.orling@linux.intel.com>> wrote:
> 
> 
>      > On Sep 29, 2017, at 1:26 AM, Guy Morand <guy@guy-morand.ch
>     <mailto:guy@guy-morand.ch>> wrote:
>      >
>      > —
>      > <snip>
>     > diff --git a/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
>     <http://python-pandas_0.20.3.bb>
>     b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb
>     <http://python-pandas_0.20.3.bb>
>     > new file mode 100644
>     > index 0000000..f4c486b
>     > --- /dev/null
>     > +++ b/meta-python/recipes-devtools/python/python-pandas_0.20.3.bb <http://python-pandas_0.20.3.bb>
>     > @@ -0,0 +1,10 @@
>     > +inherit setuptools
>     > +require python-pandas.inc
>     > +
>     > +RDEPENDS_${PN} += " \
>     > +  ${PYTHON_PN}-json \
>     > +  ${PYTHON_PN}-importlib \
>     > +  "
>     > +
>     > +SRC_URI[md5sum] = "4df858f28b4bf4fa07d9fbb7f2568173"
>     > +SRC_URI[sha256sum] = “a777e07633d83d546c55706420179551c8e01075b53c497dcf8ae4036766bc66"
> 
>     These SRC_URI checksum lines should go in the python-pandas.inc
>     file, rather than duplicate them in both the python-pandas and
>     python3-pandas files.
> 
>     It is quite common now for the “version specific” files to only be
>     the “inherit” line and the “require foo.inc” line.
> 
>     DRY and KISS.
> 
>      > diff --git
>     a/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
>     <http://python3-pandas_0.20.3.bb>
>     b/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
>     <http://python3-pandas_0.20.3.bb>
>      > new file mode 100644
>      > index 0000000..81dd360
>      > --- /dev/null
>      > +++
>     b/meta-python/recipes-devtools/python/python3-pandas_0.20.3.bb
>     <http://python3-pandas_0.20.3.bb>
>      > @@ -0,0 +1,5 @@
>      > +inherit setuptools3
>      > +require python-pandas.inc
>      > +
>      > +SRC_URI[md5sum] = "4df858f28b4bf4fa07d9fbb7f2568173"
>      > +SRC_URI[sha256sum] =
>     "a777e07633d83d546c55706420179551c8e01075b53c497dcf8ae4036766bc66"
>      > --
>      > 2.7.4
>      >
>      > --
>      > _______________________________________________
>      > Openembedded-devel mailing list
>      > Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>      > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
> 
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
> 
> 


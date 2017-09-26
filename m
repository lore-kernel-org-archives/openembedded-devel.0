Return-Path: <guy@guy-morand.ch>
Received: from smtp-sh2.infomaniak.ch (smtp-sh2.infomaniak.ch [128.65.195.6])
	by mail.openembedded.org (Postfix) with ESMTP id 446CC77E55
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 06:31:54 +0000 (UTC)
Received: from smtp6.infomaniak.ch (smtp6.infomaniak.ch [83.166.132.19])
	by smtp-sh.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8Q6VrLo019978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 26 Sep 2017 08:31:54 +0200
Received: from [192.168.13.135] ([62.192.30.6]) (authenticated bits=0)
	by smtp6.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8Q6Vqhm031077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Tue, 26 Sep 2017 08:31:53 +0200
To: Derek Straka <derek@asterius.io>
References: <1506075891-4205-1-git-send-email-guy@guy-morand.ch>
	<CADNbA1rjSSNANYovFMQEAW3bWHbc3Ey4JtuCUPWMrZa9--MR8w@mail.gmail.com>
From: Guy Morand <guy@guy-morand.ch>
Message-ID: <6d06fafc-14cc-f8b1-1d73-f83b6f6436f7@guy-morand.ch>
Date: Tue, 26 Sep 2017 08:31:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CADNbA1rjSSNANYovFMQEAW3bWHbc3Ey4JtuCUPWMrZa9--MR8w@mail.gmail.com>
X-Antivirus: Dr.Web (R) for Unix mail servers drweb plugin ver.6.0.2.8
X-Antivirus-Code: 0x100000
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/3] Add python3 matplotlib
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
X-List-Received-Date: Tue, 26 Sep 2017 06:31:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Derek,

Arrgg I just copied the recipe from my meta-layer that has a different 
structure! Sorry for wasting your time with my worthless patches, I'll 
try better!

Thanks anyway for your feedbacks!

Best regards,

Guy

On 09/26/2017 12:40 AM, Derek Straka wrote:
> Also, could you incorporate the changes into the existing python-* 
> recipes so they both use the .inc files.  It makes my automated 
> updates easier.  Thanks!
>
> On Fri, Sep 22, 2017 at 6:24 AM, Guy Morand <guy@guy-morand.ch 
> <mailto:guy@guy-morand.ch>> wrote:
>
>     ---
>      .../python-matplotlib/files/0001-fix_setup.diff    | 13 +++++++++
>      .../python/python-matplotlib/python-matplotlib.inc | 32
>     ++++++++++++++++++++++
>      .../python-matplotlib/python3-matplotlib_2.0.2.bb
>     <http://python3-matplotlib_2.0.2.bb> |  6 ++++
>      3 files changed, 51 insertions(+)
>      create mode 100644
>     meta-python/recipes-devtools/python/python-matplotlib/files/0001-fix_setup.diff
>      create mode 100644
>     meta-python/recipes-devtools/python/python-matplotlib/python-matplotlib.inc
>      create mode 100644
>     meta-python/recipes-devtools/python/python-matplotlib/python3-matplotlib_2.0.2.bb
>     <http://python3-matplotlib_2.0.2.bb>
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python-matplotlib/files/0001-fix_setup.diff
>     b/meta-python/recipes-devtools/python/python-matplotlib/files/0001-fix_setup.diff
>     new file mode 100644
>     index 0000000..8f1b505
>     --- /dev/null
>     +++
>     b/meta-python/recipes-devtools/python/python-matplotlib/files/0001-fix_setup.diff
>     @@ -0,0 +1,13 @@
>     +Index: matplotlib-2.0.2/setupext.py
>     +===================================================================
>     +--- matplotlib-2.0.2.orig/setupext.py
>     ++++ matplotlib-2.0.2/setupext.py
>     +@@ -182,7 +182,7 @@ def get_base_dirs():
>     +         'gnu0': ['/usr'],
>     +         'aix5': ['/usr/local'],
>     +         }
>     +-    return basedir_map.get(sys.platform, ['/usr/local', '/usr'])
>     ++    return basedir_map.get(sys.platform,
>     [os.environ['STAGING_LIBDIR']])
>     +
>     +
>     + def get_include_dirs():
>     diff --git
>     a/meta-python/recipes-devtools/python/python-matplotlib/python-matplotlib.inc
>     b/meta-python/recipes-devtools/python/python-matplotlib/python-matplotlib.inc
>     new file mode 100644
>     index 0000000..74dcf97
>     --- /dev/null
>     +++
>     b/meta-python/recipes-devtools/python/python-matplotlib/python-matplotlib.inc
>     @@ -0,0 +1,32 @@
>     +SUMMARY  = "Matplotlib produces publication quality figures"
>     +DESCRIPTION = "Matplotlib is a Python 2D plotting library which
>     produces \
>     +publication quality figures in a variety of hardcopy formats and
>     interactive \
>     +environments across platforms. Matplotlib can be used in Python
>     scripts, the \
>     +Python and IPython shell, the jupyter notebook, web application
>     servers, and \
>     +four graphical user interface toolkits."
>     +HOMEPAGE = "https://matplotlib.org/"
>     +LICENSE = "PSF"
>     +LIC_FILES_CHKSUM =
>     "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
>     +
>     +PYPI_PACKAGE = "matplotlib"
>     +
>     +inherit pypi
>     +
>     +SRC_URI += "\
>     +  file://0001-fix_setup.diff \
>     +  "
>     +
>     +DEPENDS += " \
>     +  ${PYTHON_PN}-numpy-native \
>     +  freetype \
>     +  libpng \
>     +  "
>     +
>     +RDEPENDS_${PN} += " \
>     +  ${PYTHON_PN}-numpy \
>     +  ${PYTHON_PN}-dateutil \
>     +  ${PYTHON_PN}-pyparsing \
>     +  ${PYTHON_PN}-pytz \
>     +  ${PYTHON_PN}-six \
>     +  ${PYTHON_PN}-cycler \
>     +  "
>     diff --git
>     a/meta-python/recipes-devtools/python/python-matplotlib/python3-matplotlib_2.0.2.bb
>     <http://python3-matplotlib_2.0.2.bb>
>     b/meta-python/recipes-devtools/python/python-matplotlib/python3-matplotlib_2.0.2.bb
>     <http://python3-matplotlib_2.0.2.bb>
>     new file mode 100644
>     index 0000000..7e309b2
>     --- /dev/null
>     +++
>     b/meta-python/recipes-devtools/python/python-matplotlib/python3-matplotlib_2.0.2.bb
>     <http://python3-matplotlib_2.0.2.bb>
>     @@ -0,0 +1,6 @@
>     +inherit setuptools3
>     +require python-matplotlib.inc
>     +
>     +SRC_URI[md5sum] = "061111784278bde89b5d4987014be4ca"
>     +SRC_URI[sha256sum] =
>     "0ffbc44faa34a8b1704bc108c451ecf87988f900ef7ce757b8e2e84383121ff1"
>     +
>     --
>     2.7.4
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



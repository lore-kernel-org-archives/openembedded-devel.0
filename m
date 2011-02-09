Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PnCp7-0008Sx-A9
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 17:23:21 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PnCo5-0001PN-4A from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 08:22:17 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 9 Feb 2011 08:22:16 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 9 Feb 2011 09:22:15 -0700
Message-ID: <4D52BF33.6010908@mentor.com>
Date: Wed, 09 Feb 2011 09:22:11 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikHqrgZawN7dtKwrp65sY4RviZzb7t2Bg_k2vfK@mail.gmail.com>
In-Reply-To: <AANLkTikHqrgZawN7dtKwrp65sY4RviZzb7t2Bg_k2vfK@mail.gmail.com>
X-OriginalArrivalTime: 09 Feb 2011 16:22:16.0050 (UTC)
	FILETIME=[83F08D20:01CBC875]
Subject: Re: Pull request from O.S. Systems
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
X-List-Received-Date: Wed, 09 Feb 2011 16:23:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2011 08:44 AM, Otavio Salvador wrote:
> Hello,
>
> I'd like to ask someone to pull from our tree.

I've given these a quick review and pull/pushed after a rebase to current.

>
> The following changes since commit a25c44e70f3ece85b41e6c4e49c1a6867dc36a12:
>
>    bug2v4l2: Fix recipe to atcually work. (2011-02-09 14:19:02 +0100)
>
> are available in the git repository at:
>    git://projetos.ossystems.com.br/git/users/otavio/org.openembedded.dev.git
> master
>
> Otavio Salvador (5):
>        slang: fix 2.2.2 URL
>        gitpkgv.bbclass: return None if repository does not exist
>        libnewt: include latest fixes and allow python removal
>        cmake-sdk: add 2.8.2 recipe
>        tzcode-native: update to 2011b
>
>   classes/gitpkgv.bbclass                            |    3 +
>   recipes/cmake/cmake-sdk_2.8.2.bb                   |   12 +++
>   recipes/newt/files/include-without-python.patch    |   71 ++++++++++++++++++++
>   recipes/newt/files/support-DESTDIR.patch           |   12 ---
>   recipes/newt/libnewt_0.52.12.bb                    |   18 +++--
>   recipes/slang/slang_2.2.2.bb                       |    4 +-
>   ...code-native_2011a.bb =>  tzcode-native_2011b.bb} |   10 ++--
>   7 files changed, 105 insertions(+), 25 deletions(-)
>   create mode 100644 recipes/cmake/cmake-sdk_2.8.2.bb
>   create mode 100644 recipes/newt/files/include-without-python.patch
>   delete mode 100644 recipes/newt/files/support-DESTDIR.patch
>   rename recipes/tzcode/{tzcode-native_2011a.bb =>  tzcode-native_2011b.bb} (51%)
>


-- 
Tom Rini
Mentor Graphics Corporation



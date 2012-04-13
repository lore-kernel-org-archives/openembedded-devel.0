Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SIeNW-0006my-Bg
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 13:09:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3D9qlGa014318
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 02:52:47 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 13 Apr 2012 02:52:47 -0700
Message-ID: <4F87F76D.1080804@windriver.com>
Date: Fri, 13 Apr 2012 17:52:45 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <CAOHjBZudis3ALttGQZ12hxKPQbXKyffZVtoB1buz4AMaamXO=A@mail.gmail.com>
In-Reply-To: <CAOHjBZudis3ALttGQZ12hxKPQbXKyffZVtoB1buz4AMaamXO=A@mail.gmail.com>
Subject: Re: [oe-core] how to add .bb file into project meta directory
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
X-List-Received-Date: Fri, 13 Apr 2012 11:09:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/13/2012 05:31 PM, Giuseppe Condorelli wrote:
> Hi All,
>
> I need to add a new version for a given package and I'm wondering if (and
> how) I can add the relative recipe in the meta-<my_project>  directory as
> well

Yes, the new version's recipe will be used by default, if it doesn't, then
add this to the .conf file

PREFERRED_VERSION_pkg = "<new_version>"

// Robert

> as I do for .bbappend files.
>
> Best Regards,
> Giuseppe
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



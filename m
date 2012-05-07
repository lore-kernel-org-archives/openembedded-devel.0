Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SRS7m-00008c-HI
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 19:53:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q47HhcWL017565
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 May 2012 10:43:38 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 7 May 2012 10:43:37 -0700
Message-ID: <4FA809C8.1000504@windriver.com>
Date: Mon, 7 May 2012 12:43:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <CAOHjBZusy84GNLJ+YXY598E4Zd5M-zAZo=hb==wVJhwTQqDPkA@mail.gmail.com>
In-Reply-To: <CAOHjBZusy84GNLJ+YXY598E4Zd5M-zAZo=hb==wVJhwTQqDPkA@mail.gmail.com>
Subject: Re: [oe-core] Prefix in rpms packages
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
X-List-Received-Date: Mon, 07 May 2012 17:53:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/12 5:30 AM, Giuseppe Condorelli wrote:
> Hi All,
>
> after having built my own image, I've looked at the resultant rpms under
> the deploy directory and I saw
> no relocation is possible (rpm -qpli<package>). This because Prefix is not
> set during spec file creation
> (package_rpm.bbclass).
> As far as you know, is it possible to set Prefix somehow?

What type of packages are you trying to relocate?

For target packages I don't expect that it would ever work.  The items built by 
the build system often have internal paths and expectations.

For SDK packages (i.e. things that run on the host), it might be possible to 
make them relocatable, but it would be specific to those style packages.  (Any 
relocatable package has to have the inbuilt knowledge to move and change 
configuration files as necessary.  Also you have to have the right set of 
packages to install into the environment and such.  I don't believe we use RPM 
to install any native/SDK packages today.)

--Mark

> Please let me know.
> Thanks,
> Giuseppe
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




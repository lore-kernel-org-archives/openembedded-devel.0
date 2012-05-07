Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SRS4m-0003cV-9q
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 19:50:24 +0200
Received: (qmail 9206 invoked by uid 1003); 7 May 2012 17:40:33 -0000
Received: from unknown (HELO ?192.168.1.102?)
	(philip@opensdr.com@71.171.22.246)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	7 May 2012 17:40:32 -0000
Message-ID: <4FA8090F.6080701@balister.org>
Date: Mon, 07 May 2012 13:40:31 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1335980745-29862-1-git-send-email-philip@balister.org>	<1335980745-29862-2-git-send-email-philip@balister.org>
	<jnrvsr$4jc$1@dough.gmane.org>
In-Reply-To: <jnrvsr$4jc$1@dough.gmane.org>
X-Enigmail-Version: 1.1.2
Subject: Re: [meta-oe 1/1] lxc : Add recipe for building Linux Containers tools.
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
X-List-Received-Date: Mon, 07 May 2012 17:50:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/02/2012 02:54 PM, Koen Kooi wrote:
> Op 02-05-12 19:45, Philip Balister schreef:
>> Linux containers are a lightweight virtualization system.
> 
>> Compile tested on F15 and lightly run tested on a pandaboard.
> 
>> Signed-off-by: Philip Balister <philip@balister.org> --- 
>> meta-oe/recipes-extended/lxc/lxc_git.bb |   21 +++++++++++++++++++++ 1
>> files changed, 21 insertions(+), 0 deletions(-) create mode 100644
>> meta-oe/recipes-extended/lxc/lxc_git.bb
> 
>> diff --git a/meta-oe/recipes-extended/lxc/lxc_git.bb
>> b/meta-oe/recipes-extended/lxc/lxc_git.bb new file mode 100644 index
>> 0000000..8f22e77 --- /dev/null +++
>> b/meta-oe/recipes-extended/lxc/lxc_git.bb @@ -0,0 +1,21 @@ +SUMMARY =
>> "Linux Containers tools" +DESCRIPTION = "Linux containers are a light
>> weight isolation system for Linux." +HOMEPAGE =
>> "http://lxc.sourceforge.net" +LICENSE = "LGPLv2.1"
> 
> Move LIC_FILES_CHKSUM to here
> 
>> + +PV = "0.8.0-rc2"
> 
> That violates the versioning policy
> 
>> + +RDEPENDS_${PN} = "perl perl-modules"
> 
> That needs to go below do_install() and specify the actual modules it needs,
> not the blanket meta-package.

It looks like the perl RDEPENDS will go away. I'll submit a revised
patch when I have checked that. Meanwhile I'll carry it on git hub while
I sort out the details.

Philip

> 
> Speaking of lxc, have you tried systemd-nspawn to launch containers yet?
> 
> regards,
> 
> Koen

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




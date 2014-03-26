Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 827126B8BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 21:09:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2QL9CAO005885; Wed, 26 Mar 2014 21:09:12 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9Q1N15z6QeXe; Wed, 26 Mar 2014 21:09:12 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2QL96tS005843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 26 Mar 2014 21:09:07 GMT
Message-ID: <1395868139.24890.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adam Lee <adam.yh.lee@gmail.com>
Date: Wed, 26 Mar 2014 21:08:59 +0000
In-Reply-To: <CAFeBWL6621Uh34_s8soK39mNM56zRE1-+rKJ0ehRDTDSVdrHfw@mail.gmail.com>
References: <CAFeBWL6KbMhysVEaXL8aNYdX6pn8BEGOT4hdg9Mnmx1zc4dzSQ@mail.gmail.com>
	<CAFeBWL6R8N1B5CjKaZawmMUjV7i=ei2BwpMg+v_1is4oFzbGJw@mail.gmail.com>
	<CAFeBWL7xAbqbsAZhJGaPBrL9DCdctfdau828WzE-Bojynodnsw@mail.gmail.com>
	<1395821266.24890.80.camel@ted>
	<CAFeBWL6621Uh34_s8soK39mNM56zRE1-+rKJ0ehRDTDSVdrHfw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: exo build fail on master and master-next
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Mar 2014 21:09:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-03-26 at 14:00 -0700, Adam Lee wrote:
> Hi Richard, thanks for the explanation. It helped me in understanding
> about the commit. 
> 
> 
> intltool-native builds fine. This suggests me that I have the
> dependencies requirement for intltool-native. Also I apt-get installed
> intltool on my build server just in case. However, I still get
> exo-native build error. Just letting you know, the recipes involved
> are all under the OE layer (meta-xfce). I am building for Gumstix
> Overo, which is not the default build target, but this error is not
> platform dependent. I still get the same result on qemuarm. 
> 
> 
> At any rate, I now know it's a dependency issue, so that's where I
> will start digging and report back.

Right, to be more specific, try adding DEPENDS += "intltool-native" to
the recipe.

Cheers,

Richard





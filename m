Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1HiFQ4-0008LG-A9
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2007 21:50:57 +0200
Received: by py-out-1112.google.com with SMTP id n39so1130931pyh
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2007 12:41:43 -0700 (PDT)
Received: by 10.35.110.13 with SMTP id n13mr9738381pym.1177875703058;
	Sun, 29 Apr 2007 12:41:43 -0700 (PDT)
Received: from ?192.168.10.106? ( [71.85.151.212])
	by mx.google.com with ESMTP id 7sm16497258nzn.2007.04.29.12.41.41;
	Sun, 29 Apr 2007 12:41:42 -0700 (PDT)
Message-ID: <4634F4AD.5000109@gmail.com>
Date: Sun, 29 Apr 2007 14:40:29 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20070427105722.GA4340@twibble.org> <463478B9.3010602@gmail.com>
	<20070429130503.GA8755@twibble.org>
In-Reply-To: <20070429130503.GA8755@twibble.org>
Subject: Re: perl 5.8.8 is ready
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
X-List-Received-Date: Sun, 29 Apr 2007 19:50:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jamie Lenehan wrote:
> On Sun, Apr 29, 2007 at 05:51:37AM -0500, Junqian Gordon Xu wrote:
> [...]
>   
>> Machine=Tosa
>> Distro=Angstrom
>>
>> perl-native-5.8.8 builds fine. But when I run bitbake perl-5.8.8,
>> it alway try to build perl-native-5.8.7 and perl-5.8.7 first. Am I 
>> missing something?
>>     
>
> As has already been mentioned this is due to DEFAULT_PREFERENCE setting. You
> can remove or change the DEFAULT_PREFERENCE or explicitly request bitbake to
> build the newer versions. See the section in the user manual that talks
> about this:
>
>   http://www.openembedded.org/user-manual&dpage=recipes_defaultpreference
>
>   
I've commented out the DEFAULT_PREFERENCE or set it to 0. But it still 
wants to compile 5.8.7 first.

Probably I did something wrong in my set-up. I will take a close look at 
the bb manual.

Thanks
Gordon




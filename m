Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1RC72d-0001AI-T5
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 11:48:31 +0200
Received: from cpc9-live22-2-0-cust200.know.cable.virginmedia.com
	([82.42.173.201] helo=[192.168.1.101])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1RC6wn-0007mZ-JM
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 09:42:29 +0000
Message-ID: <4E8EC993.9030105@dynamicdevices.co.uk>
Date: Fri, 07 Oct 2011 10:42:43 +0100
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E81B106.8040801@tu-braunschweig.de>
In-Reply-To: <4E81B106.8040801@tu-braunschweig.de>
Subject: Re: Debugging OpenEmbedded Builds
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
X-List-Received-Date: Fri, 07 Oct 2011 09:48:32 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi Christian,

What I often do to check out the recipe building is something like this...

bitbake -D -f -c clean foobarrecipe

The -D gives you lots of debugging output so you can see things happening

The -f forces bitbake to do what you say

(otherwise it's likely to check its internal state for a recipe, decide 
the recipe has already been built, and ignore you. You can often tell if 
you've been ignored as it'll say XXX tasks, of which XXX didn't need to 
be executed, where XXX is the same number meaning nothing happened)

The -c specifies a command. The clean command wipes out the working 
directory in your tree. The working directory will depend on what you're 
building but will probably be somewhere in 
./openembedded/build/tmp_XXX/work/. You can use find or similar on the 
name of your recipe to figure out where it is.

So clean wipes things out, then you can try

bitbake -D -c compile foobarrecipe

Note that we're not forcing things here, and we already have that recipe 
in a "clean" state which means bitbake
will go through the intermediary stages to get a compilation done, 
unpacking, patching and so forth.

After that's finished you can go to the working directory for the recipe 
and see what happened - you should see
output files and so forth, and you can look in the temp folder in there 
to see the logs and scripts that are used.

Also, you probably want to make sure RM_WORK is commented out of your 
configuration file (local.conf I think)
as otherwise bitbake will clean up the working directories after itself. 
I still think the compile command I suggest
will work ok but if you do a full build of a recipe then at the end the 
work files will be cleaned. Note that removing
RM_WORK will likely make your build tree MUCH bigger!

There are better ways I'm sure, such as using devshell, but this is the 
mechanism that works for me.

Cheers,

Alex Lennon

Dynamic Devices Ltd
http://www.dynamicdevices.co.uk

On 27/09/2011 12:18, Christian Keck wrote:
> How can debug an OpenEmbedded build? I have made some changes to a 
> board file, but it seems that my changes have no effect. Is there a 
> opportunity to look into source code just before they are compiled?
>
> Thanks, Christian
>



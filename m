Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 97CBF6F66B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 17:36:25 +0000 (UTC)
Received: (qmail 23191 invoked by uid 1003); 13 Mar 2014 17:36:26 -0000
Received: from unknown (HELO ?172.21.169.133?)
	(philip@opensdr.com@195.37.186.61)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	13 Mar 2014 17:36:26 -0000
Message-ID: <5321EC92.6070304@balister.org>
Date: Thu, 13 Mar 2014 18:36:18 +0100
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <532065C9.30300@pseudoterminal.org>
	<CAMCfZKHx9PnjzqfJSXUj-ZOvG2b_PPWnAWdD6jqS+Npx3xsX8A@mail.gmail.com>
In-Reply-To: <CAMCfZKHx9PnjzqfJSXUj-ZOvG2b_PPWnAWdD6jqS+Npx3xsX8A@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: Using openembedded with externally built kernel
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
X-List-Received-Date: Thu, 13 Mar 2014 17:36:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 03/13/2014 12:56 PM, Diego Sueiro wrote:
> On Wed, Mar 12, 2014 at 10:48 AM, Carlos Rafael Giani <dv@pseudoterminal.org
>> wrote:
> 
>> I have a platform with a very barebones BSP that builds and patches a 2.6
>> kernel using a whole lot of shell scripts and patch files.
>> Integrating this build process into a .bb file is too complicated at the
>> moment.
>>
>> Since cross compiling all packages I need is a nightmare to do manually, I
>> wonder if I can get OE to use the prebuilt kernel along with
>> its kernel modules and headers instead of trying to build a new kernel.
>> Ideally, I would just tell it where the kernel headers are, where
>> the uImage is, and where the modules are. I imagine this as some kind of
>> kernel .bb file setting things up to not actually build anything.
>>
>> My question is: is this possible? All I could find was about external
>> toolchains and external kernel modules.
>>
> 
> I believe that you have to wright your own recipe with custom do_compile,
> do_install etc functions.

Write a recipe that "installs" the pre-built kernel and a tarball of
modules and commit the binary kernel and modules into the bsp layer.
Yeah, this is hacky, but does give you some repeatibility.

Philip

> 
> 
> 
> Abraços,
> 
> --
> *dS
> Diego Sueiro
> 
> Administrador do Embarcados
> www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
> 
> /*long live rock 'n roll*/
> 


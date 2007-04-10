Received: from [216.182.48.170] (helo=beastbox.kfctristate.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <tom@openhardware.net>) id 1Hb4yI-0007Ec-Sz
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 03:16:35 +0200
Received: (qmail 31250 invoked from network); 10 Apr 2007 01:16:33 -0000
Received: from unknown (HELO ?172.30.107.2?) (172.30.107.2)
	by beastbox.kfctristate.com with SMTP; 10 Apr 2007 01:16:33 -0000
Message-ID: <461AE55E.6020301@openhardware.net>
Date: Mon, 09 Apr 2007 21:16:14 -0400
From: Tom Walsh <tom@openhardware.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070305)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4611582F.8010203@openhardware.net>	<f96d234e0704050628p3f72ec6exe9ef8ea5c732d80b@mail.gmail.com>	<c384c5ea0704081010y623cdbafq4f9dce1148a593e5@mail.gmail.com>	<461972D6.1060901@openhardware.net>	<461A6F08.3020904@openhardware.net>
	<f96d234e0704091138j7118f436j4f4a3cc3edee4446@mail.gmail.com>
In-Reply-To: <f96d234e0704091138j7118f436j4f4a3cc3edee4446@mail.gmail.com>
Subject: Re: versioning madness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2007 01:16:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Cliff Brake wrote:
> On 4/9/07, Tom Walsh <tom@openhardware.net> wrote:
>   
>> Tom Walsh wrote:
>>     
>>> AH!  You know, I use svn regularly and I didn't even think about using
>>> it against the OE tree!  Thanks, that would be the best solution for me.
>>>
>>>
>>>       
>> Nope, didn't work as well as I had hoped.  Both monotone and subversion
>> bit^H^H^H complain about having an existing directory, so, I cannot
>> "overlay" into the OE tree with either.
>>
>> I'll just have to do it the old-fashioned way and edit the stuff with vi.
>>     
>
> I don't understand?  I have two trees that are completely separate
> from each other:
>
> openembedded (HEAD of OE managed with monotone)
> openembedded.custom (custom stuff managed with SVN)
>
> The beauty of this setup is the trees do not interfere with each other.
>
>   
True, I was doing it that way, having two source trees.  That works fine 
if your recipes are for something that is not already in the OE tree.  
However, it becomes problematic where you have the same recipe in both 
trees.

For example, sysvinit.  I have changes to sysvinit that I want to make.  
So, you can do that only one of two ways:

1. create a subdir under the OE tree as 
'$projroot/org.openembedded.dev/packages/sysvinit/sysvinit/zipit', where 
'zipit' is the name of my MACHINE.  Copy initab into the 'zipit' dir, 
then edit your changes.  Done.

2. duplicate the recipe for sysvinit into the private tree 
($projroot/zipitbbfiles/sysvinit).  Do the same here with creating the 
new MACHINE dir ($projroot/zipitbbfiles/sysvinit/sysvinit/zipit/), copy 
& edit inittab as before.

When the two recipe trees are specified within 
$projdir/build/conf/local.conf as BBFILES := 
"$projdir/zipitbbfiles/*/*.bb 
$projdir/org.openembedded.dev/packages/*/*.bb", still no problem.

The problem comes up later when someone edits the recipe for 
$projroot/org.openembedded.dev/packages/sysvinit/sysvinit_2.86.bb and 
changes the PR = "rX" to a value larger than the one contained inside 
$projdir/zipitbbfiles/sysvinit_2.86.bb.  Guess what happens now?  The 
undesired recipe now takes precedence over the private recipe copy as PR 
gets asserted in the numerical version vote!

Do you see the problems? 

A) The problem is that my recipe would be outvoted in the second case 
structure of a private tree having a duplicate recipe.

B) There appears no convenient way to manage the addition of an 
extension to a recipe that is kept inside the OE tree (without commiting 
that into the main OE repository).  That is the problem with the first 
case example.


I guess that the issue(s) are not so much "versioning" but "source 
control" as the PV version voting borks private copies.  And, a code 
versioning system like subversion (or another copy of monotone, perhaps) 
is unable to do source control within the org.openembedded.dev OE main 
tree copy.

That's what I would like to resolve.  I could commit my board changes 
into the OE repository, but, as it is a proprietary hardware design, I 
doubt that anyone would encounter one as surplus.

There are some more issues, but, I'll stop here.  heh.

Regards,

TomW


> Cliff
>
>   


-- 
Tom Walsh - WN3L - Embedded Systems Consultant
http://openhardware.net http://cyberiansoftware.com http://openzipit.org
"Windows? No thanks, I have work to do..."
----------------------------------------------------





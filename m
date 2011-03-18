Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q0WJX-0005i9-Ci for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 10:49:51 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q0WHs-0004oU-1G for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 10:48:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 10:48:04 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 10:48:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 18 Mar 2011 10:47:49 +0100
Message-ID: <ilv9o6$t5p$1@dough.gmane.org>
References: <1300180117.2522.14.camel@eha>
	<20110315220301.GC3042@denix.org>	<1300254477.2818.5.camel@eha>	<989A078976CDAD4CB2DC976EEF70E2A50547990E@eu2-mail.mgc.mentorg.com>	<4D8061DE.6030106@gmail.com>	<AANLkTikfnLb0XW6B6M0s+w=VuOkaeq0=MrYwUniQ6B_x@mail.gmail.com>	<20110316080500.GA3414@jama.jama.net>	<989A078976CDAD4CB2DC976EEF70E2A505479928@eu2-mail.mgc.mentorg.com>	<989A078976CDAD4CB2DC976EEF70E2A505479ABD@eu2-mail.mgc.mentorg.com>	<989A078976CDAD4CB2DC976EEF70E2A505479B8C@eu2-mail.mgc.mentorg.com>
	<20110318083802.GA17785@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110318083802.GA17785@jama.jama.net>
X-Enigmail-Version: 1.0.1
Subject: Re: Python-native dependency in libxml2
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
X-List-Received-Date: Fri, 18 Mar 2011 09:49:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-03-11 09:38, Martin Jansa wrote:
> On Fri, Mar 18, 2011 at 08:41:40AM +0100, Ahsan, Noor wrote:
>> Hello Martin/Frans and Khem,
>> Any recommendation after following analysis that how should I proceed.
>> Should I send the patches to community?
> 
> Maybe koen will reply with more info about xml2po issue he found, imho
> it wasn't in xml2po build but while using xml2to to generate docs in some
> other recipe.

The issue I had that I needed xml2{t,p}o to work on the target as well
for native compilation. If that still works, Noors changes is fine by me.

regards,

Koen

>  
> IIRC I had similar issue in some other recipe, but unfortunatelly don't 
> remember which one.
> 
> Regards,
> 
>>
>> Regards,
>> Noor
>>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Ahsan, Noor
>> Sent: Thursday, March 17, 2011 3:41 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] Python-native dependency in libxml2
>>
>> Hello,
>>
>> Today I got the fresh stuff and tried to build gnome-doc-utils-native
>> (to build xml2po package). I am building on Ubuntu host 9.10. First it
>> gave me an error that it could not find intltoolize command. You can see
>> the attached build log "build_intltool_error,log". So I added intltool
>> package in gnome-doc-utils-native DEPENDS so it built successfully. You
>> can see the build log "build_intltool_fix.log". Then I removed all the
>> build stuff from build DIR and commented DEPENDS_virtclass-native =
>> "python-native" and XPY_virtclass-native = "
>> --with-python=${PYTHON_DIR}" in libxml2.inc file. Rebuild
>> gnome-doc-utils-native. It built successfully again. The build log is
>> also attached "build_no_python.log". I think there is no need of python
>> dependency in libxml2 package. Kindly correct me if I am doing anything
>> wrong.
>>
>> We need to fix gnome-doc-utils-native recipe, so that it does not show
>> intltoolize error.
>>
>> Regards,
>> Noor
>>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Ahsan, Noor
>> Sent: Wednesday, March 16, 2011 1:39 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] Python-native dependency in libxml2
>>
>> Hello,
>>
>> I made 2 changes, first one was to remove python-native from DEPENDS and
>> second was commented out XPY_virtclass-native = "
>> --with-python=${PYTHON_DIR}". Moreover I removed all the stuff from
>> build dir, so there were not python-native for me. After kicking this
>> build libxml2-native build fine.
>>
>> I was looking for xml2po recipe, I couldn't find it. Can you tell me how
>> to build xml2po package so that I can reproduce the problem.
>>
>> Regards,
>> Noor
>>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Martin Jansa
>> Sent: Wednesday, March 16, 2011 1:05 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] Python-native dependency in libxml2
>>
>> On Wed, Mar 16, 2011 at 08:28:39AM +0100, Frans Meulenbroeks wrote:
>>> 2011/3/16 Khem Raj <raj.khem@gmail.com>:
>>>> On 3/15/2011 11:22 PM, Ahsan, Noor wrote:
>>>>>
>>>>> Hello,
>>>>>
>>>>> I was looking at the libxml2 package. While going through the
>> recipes I
>>>>> came to know that its native package depends on python-native
>> package as
>>>>> well. This dependency is defined in libxml2.inc file.
>>>>>
>>>>> DEPENDS_virtclass-native = "python-native"
>>>>>
>>>>> This package build fine after removing this dependency. I am not
>> clear
>>>>> why this dependency is being added in libxml2 package. Can somebody
>>>>> clear that to me. While looking at the git log I came to know that
>> this
>>>>> change is coming from libxml2-native.inc file. But I am not clear
>> why
>>>>> this dependency was added as this package build fine without it.
>>>>>
>>>>> Please help me in understanding this dependency. Thanks.
>>>>
>>>> Try to build this recipe from scratch and see if it still works then
>> we can
>>>> remove the dep
>>
>> That's not enough, libxml2-native builds fine.. but then xml2po
>> will fail if there isn't libxml2-native built with python support.
>>
>> see a25f07ca6159e1cd5b8a215ca5da8405fb1b9053
>>
>> So yes.. for such tests you should build recipe from scratch _and_ check
>> if resulting package/sysroot is still the same.
>>
>> Regards,
>>
>>> I'm not sure if that is the right way.
>>> It might well be that typically python-native is already there in a
>>> scratch build because some earlier package needed it (or even because
>>> of the scheduling of build steps.
>>>
>>> Probably a better way is to build with packaged staging (with staging
>>> dir outside TMPDIR) then rm TMPDIR and bake the package.
>>> Alternately peek into the package to see if it needs python. If it is
>>> needed then the DEPENDS should stay.
>>>
>>> Looking at the issue at hand maybe the best person to ask is Martin
>>> Jansa as he last touched that line according to git blame:
>>> 3cd9ddbf recipes/libxml/libxml2.inc  (Martin Jansa
>>> 2010-02-26 12:32:53 +0100  5) DEPENDS_virtclass-native =
>>> "python-native"
>>>
>>> The other thing is that further on in the .inc file I see:
>>> XPY_virtclass-native = " --with-python=${PYTHON_DIR}"
>>>
>>> This strongly suggests a hard dependency on python, so removing the
>>> DEPENDS "because it builds without it" does not seem to be a good plan
>>> to me.
>>>
>>> My strong feeling is that recipes should be self-contained (so should
>>> list all packages they need to build, minus the ones that are
>>> inherited from classes (and maybe a few implicit ones like maybe make)
>>>
>>> Frans
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> -- 
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNgypFMkyGM64RGpERAka3AJ91Dpu6+SCx3MH0HtK6LUyEnaH7tACeM4EP
b0nPj51+QTs4wdONs4BCP7Y=
=Zxcy
-----END PGP SIGNATURE-----




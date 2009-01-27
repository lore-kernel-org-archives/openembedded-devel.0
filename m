Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LRrZL-0002ls-KL
	for openembedded-devel@openembedded.org; Tue, 27 Jan 2009 18:17:47 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LRrS3-0005w2-Fv
	for openembedded-devel@openembedded.org; Tue, 27 Jan 2009 17:10:15 +0000
Received: from 87-205-168-20.adsl.inetia.pl ([87.205.168.20])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 27 Jan 2009 17:10:15 +0000
Received: from uzytkownik2 by 87-205-168-20.adsl.inetia.pl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 27 Jan 2009 17:10:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Maciej Piechotka <uzytkownik2@gmail.com>
Date: Tue, 27 Jan 2009 18:04:02 +0100
Message-ID: <8763k0adfh.fsf@news.piechotka.com.pl>
References: <8763k3czl7.fsf@news.piechotka.com.pl> <glj38s$615$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 87-205-168-20.adsl.inetia.pl
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.3 (gnu/linux)
Cancel-Lock: sha1:heTFfZGeohZb8wsZkVCchoPxk/4=
Sender: news <news@ger.gmane.org>
Subject: Re: Problem with building connman
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
X-List-Received-Date: Tue, 27 Jan 2009 17:17:47 -0000
Content-Type: text/plain; charset=us-ascii

Ingvaldur Sigurjonsson <ingi@telia.com> writes:

> Maciej Piechotka wrote:
>> If I try to build connman using bitbake + oembedded I get the following
>> errors:
>> 	then mv -f ".deps/main.Tpo" ".deps/main.Po"; else rm -f ".deps/main.Tpo"; exit 1; fi
>> In file included from main.c:37:
>> connman.h:26:26: error: connman/dbus.h: No such file or directory
>> connman.h:56:25: error: connman/log.h: No such file or directory
>> connman.h:63:28: error: connman/plugin.h: No such file or directory
>> connman.h:68:30: error: connman/security.h: No such file or directory
>> In file included from main.c:37:
>> connman.h:71: warning: 'enum connman_security_privilege' declared inside parameter list
>> connman.h:71: warning: its scope is only this definition or declaration, which is probably not what you want
>> connman.h:73:26: error: connman/ipv4.h: No such file or directory
>> connman.h:75: warning: 'enum connman_ipv4_method' declared inside parameter list
>> connman.h:78:30: error: connman/resolver.h: No such file or directory
>> connman.h:85:29: error: connman/storage.h: No such file or directory
>> connman.h:91: warning: 'struct connman_device' declared inside parameter list
>> connman.h:92: warning: 'struct connman_device' declared inside parameter list
>> connman.h:94: warning: 'struct connman_network' declared inside parameter list
>> connman.h:95: warning: 'struct connman_network' declared inside parameter list
>> connman.h:97:28: error: connman/driver.h: No such file or directory
>> connman.h:99: warning: 'struct connman_driver' declared inside parameter list
>> connman.h:101:29: error: connman/element.h: No such file or directory
>> connman.h:109: warning: 'struct connman_element' declared inside parameter list
>> connman.h:113: warning: 'enum connman_element_type' declared inside parameter list
>> connman.h:113: warning: 'struct connman_element' declared inside parameter list
>> connman.h:116: warning: 'enum connman_element_type' declared inside parameter list
>> connman.h:116: warning: 'struct connman_element' declared inside parameter list
>> connman.h:118: warning: 'enum connman_element_type' declared inside parameter list
>> connman.h:118: warning: 'struct connman_element' declared inside parameter list
>> connman.h:120: warning: 'struct connman_element' declared inside parameter list
>> connman.h:121: warning: 'struct connman_element' declared inside parameter list
>> connman.h:123: warning: 'enum connman_element_type' declared inside parameter list
>> connman.h:125: warning: 'struct connman_element' declared inside parameter list
>> connman.h:129: warning: 'struct connman_element' declared inside parameter list
>> connman.h:156:28: error: connman/device.h: No such file or directory
>> connman.h:161: warning: 'struct connman_device' declared inside parameter list
>> connman.h:162: warning: 'struct connman_device' declared inside parameter list
>> connman.h:164: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__connman_device_has_driver'
>> connman.h:166: error: expected ')' before 'flightmode'
>> connman.h:168:29: error: connman/network.h: No such file or directory
>> connman.h:174: warning: 'struct connman_device' declared inside parameter list
>> connman.h:174: warning: 'struct connman_network' declared inside parameter list
>> connman.h:176: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__connman_network_has_driver'
>> connman.h:178:26: error: connman/rtnl.h: No such file or directory
>> main.c: In function 'main':
>> main.c:136: error: 'CONNMAN_SERVICE' undeclared (first use in this function)
>> main.c:136: error: (Each undeclared identifier is reported only once
>> main.c:136: error: for each function it appears in.)
>> make[2]: *** [main.o] Error 1
>>
>> What's wrong?
>>
>> Regards
>
>   I had this problem last week. The problem was that the include files
> were symlinks that pointed to '/include/connman/dbus.h' etc and all
> definitely wrong.
>
>   Just recreate all the symlinks manually i.e. cd into the
> connman-directory and into the directory which has all the wrong
> .-h-file symlinks (they should show up red) and enter the command:
>> for f in *.h; do ln -fs ../$f $f; done
>
>   But only do that if all .h-file-symlinks are pointing to
> non-existing files. Otherwise just fix them manually.
>
> Regards
> - I

That works. Why it is not written into bb file then?

Regards
-- 
I've probably left my head... somewhere. Please wait untill I find it.
Homepage (pl_PL): http://uzytkownik.jogger.pl/
(GNU/)Linux User: #425935 (see http://counter.li.org/)




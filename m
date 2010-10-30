Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1PC8Wg-0003z6-4b
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 12:19:07 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Sat, 30 Oct 2010 12:16:23 +0200
Message-ID: <3F7F8AC4C7A0A042A2FE40720B75E208F0321F@nvs0086.nedap.local>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <3F7F8AC4C7A0A042A2FE40720B75E208F0321F@nvs0086.nedap.local>
Thread-Topic: [oe] bitbake error?
Thread-Index: Act3fOej4MJDQJgST3uhlH/0gMA2EAAnplKw
References: <4CC97820.5090808@nedap.com><loom.20101029T033738-284@post.gmane.org><4CCA94CC.3080302@phoenixsoftware.it>
	<AANLkTimpAJJUoDkY=JvH6o39kssgWdGkgWs_fHa4q-Gd@mail.gmail.com>
From: "Jaap de Jong" <jaap.dejong@nedap.com>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake error?
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
X-List-Received-Date: Sat, 30 Oct 2010 10:19:08 -0000
X-Groupsio-MsgNum: 25637
Content-class: urn:content-classes:message
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01CB781B.C4874F43"

------_=_NextPart_001_01CB781B.C4874F43
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

That fixes it...

If relevant:=20
org.openembedded/conf/sanity.conf needs to be patched?

    -BB_MIN_VERSION =3D "1.8.18"
    +BB_MIN_VERSION =3D "1.10.1"

Thanks!

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org on behalf of =
James Ronald
Sent: Fri 10/10/29 17:20
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] bitbake error?
=20
Pierluigi,

Thanks! Installing bitbake-1.10.1 fixed my problem.

- Jim

On Fri, Oct 29, 2010 at 5:33 AM, Pierluigi Passaro
<pierluigi.passaro@phoenixsoftware.it> wrote:
>
> Not sure this is the best solution, but I solved same issue using =
latest bitbake 1.10.1 downloaded from
>
> http://download.berlios.de/bitbake/bitbake-1.10.1.tar.gz
>
>
> James Ronald wrote:
>>
>> Jaap de Jong <jaap.dejong <at> nedap.com> writes:
>>
>>
>>>
>>> I'm probably totally stupid...
>>> What am doing wrong?
>>> (I'm working on a fresh unstable branch)
>>> When I bitbake I get:
>>>
>>> MACHINE=3Dat91sam9263ek =A0bitbake u-boot
>>> Traceback (most recent call last):
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", line =
143, in <module>
>>> =A0 =A0 main()
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", line =
123, in main
>>> =A0 =A0 cooker.parseConfiguration()
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py", =
line 68, in parseConfiguration
>>> =A0 =A0 self.parseConfigurationFile( os.path.join( "conf", =
"bitbake.conf" ) )
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py", =
line 402, in parseConfigurationFile
>>> =A0 =A0 bb.fetch.fetcher_init(self.configuration.data)
>>> =A0 File =
"/media/OpenEmbedded/unstable/bitbake/lib/bb/fetch/__init__.py", line =
93, in fetcher_init
>>> =A0 =A0 pd =3D persist_data.PersistData(d)
>>> =A0 File =
"/media/OpenEmbedded/unstable/bitbake/lib/bb/persist_data.py", line 52, =
in __init__
>>> =A0 =A0 bb.mkdirhier(self.cachedir)
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.py", =
line 133, in mkdirhier
>>> =A0 =A0 debug(3, "mkdirhier(%s)" % dir)
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.py", =
line 103, in debug
>>> =A0 =A0 bb.msg.debug(lvl, None, ''.join(args))
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/msg.py", line =
100, in debug
>>> =A0 =A0 bb.event.fire(MsgDebug(msg, None))
>>> =A0 File "/media/OpenEmbedded/unstable/bitbake/lib/bb/event.py", =
line 67, in fire
>>> =A0 =A0 if tmpHandler(event) =3D=3D Handled:
>>> =A0 File "tmpHandler(e)", line 8, in tmpHandler
>>> NameError: global name 'msg' is not defined
>>>
>>>
>>
>> I'm getting the exact same error. I'm new to OE and just going =
through the Getting started wiki entry. Ubuntu 10.04 installing bitbake =
via apt-get install bitbake.
>>
>> bitbake --version BitBake Build Tool Core version 1.8.18, bitbake =
version 1.8.18
>> =A0OE is current as of a few minutes ago.
>>
>> jr@ubuntu-xpc:~/oe/build$ bitbake nano
>> Traceback (most recent call last):
>> =A0File "/usr/bin/bitbake", line 143, in <module>
>> =A0 =A0main()
>> =A0File "/usr/bin/bitbake", line 123, in main
>> =A0 =A0cooker.parseConfiguration()
>> =A0File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 67, in =
parseConfiguration
>> =A0 =A0self.parseConfigurationFile( os.path.join( "conf", =
"bitbake.conf" ) )
>> =A0File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 401, in =
parseConfigurationFile
>> =A0 =A0bb.fetch.fetcher_init(self.configuration.data)
>> =A0File "/usr/lib/pymodules/python2.6/bb/fetch/__init__.py", line 93, =
in fetcher_init
>> =A0 =A0pd =3D persist_data.PersistData(d)
>> =A0File "/usr/lib/pymodules/python2.6/bb/persist_data.py", line 52, =
in __init__
>> =A0 =A0bb.mkdirhier(self.cachedir)
>> =A0File "/usr/lib/pymodules/python2.6/bb/__init__.py", line 133, in =
mkdirhier
>> =A0 =A0debug(3, "mkdirhier(%s)" % dir)
>> =A0File "/usr/lib/pymodules/python2.6/bb/__init__.py", line 103, in =
debug
>> =A0 =A0bb.msg.debug(lvl, None, ''.join(args))
>> =A0File "/usr/lib/pymodules/python2.6/bb/msg.py", line 100, in debug
>> =A0 =A0bb.event.fire(MsgDebug(msg, None))
>> =A0File "/usr/lib/pymodules/python2.6/bb/event.py", line 67, in fire
>> =A0 =A0if tmpHandler(event) =3D=3D Handled:
>> =A0File "tmpHandler(e)", line 8, in tmpHandler
>> NameError: global name 'msg' is not defined
>>
>> - Jim
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


------_=_NextPart_001_01CB781B.C4874F43
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+IhEKAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEAGAAAAFJFOiBbb2VdIGJpdGJha2Ug
ZXJyb3I/APgHAQWAAwAOAAAA2gcKAB4ADAAQABcABgBCAQEggAMADgAAANoHCgAeAAwAEgAQAAYA
PQEBCYABACEAAAAzQUU4QUZDRERFNUE5MDQ0QTk4RkRBRDAyOUVDRTUwOACVBwEDkAYAYBAAADkA
AAADACYAAAAAAAMANgAAAAAAQAA5AEXH7oAbeMsBHgA9AAEAAAAFAAAAUkU6IAAAAAACAUcAAQAA
AC4AAABjPXVzO2E9IDtwPU5lZGFwO2w9TlZTMDA4Ni0xMDEwMzAxMDE4MTZaLTI4NjYAAAAeAEkA
AQAAABgAAABSZTogW29lXSBiaXRiYWtlIGVycm9yPwBAAE4AANcbxHx3ywEeAFoAAQAAADIAAABv
cGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnAAAAAgFbAAEA
AACBAAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAAAAb3BlbmVtYmVkZGVkLWRldmVsLWJvdW5jZXNA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZwBTTVRQAG9wZW5lbWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcAAAAAAgFcAAEAAAA3AAAAU01UUDpPUEVORU1CRURERUQtREVW
RUwtQk9VTkNFU0BMSVNUUy5PUEVORU1CRURERUQuT1JHAAAeAF0AAQAAAA0AAABKYW1lcyBSb25h
bGQAAAAAAgFeAAEAAABBAAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAAAASmFtZXMgUm9uYWxkAFNN
VFAAamFtZXMucm9uYWxkQGdtYWlsLmNvbQAAAAACAV8AAQAAABwAAABTTVRQOkpBTUVTLlJPTkFM
REBHTUFJTC5DT00AHgBmAAEAAAAFAAAAU01UUAAAAAAeAGcAAQAAADIAAABvcGVuZW1iZWRkZWQt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnAAAAHgBoAAEAAAAFAAAAU01UUAAA
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
JTwBACA9sS8D8GBAOMACMHIiMCBVi0ngAjB1MrEuMDRvsbk8DiB2BzBBoAUwLWPx/9sGOEZdN1WX
OFYqsC4AmnHVMDFCHkBCOJJCOlBUgf80AAbwEsFIAd+2JhRJwdvW3+HLVZdmwtahSFFjCHAYwN9p
wUMgMMJgwQfRbQuASXCbB5Er0G/d/9cAckA3QAHaYi14cGM6fi/3OBBQoODCJDhHK1DQ8FWX32iP
aZ/kG8KlS2Byda9vT/9wWHEIcbzt7+7/dt/xXHjv33n/8w+Kcn8QcARz+oFIMPECIDIuNoqvxon3
n/X//2bggo+Dn4Svhb/4z/nf+u/7+/+L4TH9P40/cPmPH5Av/5E/BG8FfwaKlg+XH5gvcPn/mg+b
Hw5fD28GXaAfoS+iOv8Ku6PvpP0XzxjfBrcRz6qP/6uYcQis/64PH98g7yH/Iw//tD8dL7Z/t48o
Lyk/Kk+8r/8svwqsv8/A3zEPMh8GbMXP/8bfcPnIv8nPOR/MD80fzimvzu/P/9EPVYgtVpBpTgZ/
VYgrUEo/S09MCVWXw3Jl/cPFLdEwP+DdYPIx23PvwLfXME0fTihAT1IBoG9QORdRoDCASDdo2KBw
Oi/nimFRcu/BdXhcMOcRUoH5BzBnaWeQ9CFO0vIw9DDzT1LwYGZv6UBQP0kdSDX/Sh9aD0w/WMNQ
L06/XD9Q7/9R/1jhU09UX1VvVn9Xhkg0/1r/aC9bP0hwXv9dn2pPX9+/YO5iD2MfZC9lP2ZMfXTg
HgA1EAEAAAA9AAAAPDNGN0Y4QUM0QzdBMEEwNDJBMkZFNDA3MjBCNzVFMjA4RjAzMjFGQG52czAw
ODYubmVkYXAubG9jYWw+AAAAAB4AORABAAAAqgAAADw0Q0M5NzgyMC41MDkwODA4QG5lZGFwLmNv
bT48bG9vbS4yMDEwMTAyOVQwMzM3MzgtMjg0QHBvc3QuZ21hbmUub3JnPjw0Q0NBOTRDQy4zMDgw
MzAyQHBob2VuaXhzb2Z0d2FyZS5pdD4gPEFBTkxrVGltcEFKSlVvRGtZPUp2SDZvMzlrc3NnV2RH
a2dXc19mSGE0cS1HZEBtYWlsLmdtYWlsLmNvbT4AAAAeAEcQAQAAAA8AAABtZXNzYWdlL3JmYzgy
MgAACwDyEAEAAAAfAPMQAQAAAEAAAABSAEUAJQAzAEEAIABbAG8AZQBdACAAYgBpAHQAYgBhAGsA
ZQAgAGUAcgByAG8AcgAlADMARgAuAEUATQBMAAAACwD2EAAAAABAAAcwRcfugBt4ywFAAAgwCjuT
xBt4ywEDAN4/r28AAAMA8T8JBAAAHgD4PwEAAAANAAAASmFhcCBkZSBKb25nAAAAAAIB+T8BAAAA
YAAAAAAAAADcp0DIwEIQGrS5CAArL+GCAQAAAAAAAAAvTz1ORURBUC9PVT1GSVJTVCBBRE1JTklT
VFJBVElWRSBHUk9VUC9DTj1SRUNJUElFTlRTL0NOPUpESjQ3MzQzNTIyAB4A+j8BAAAAFQAAAFN5
c3RlbSBBZG1pbmlzdHJhdG9yAAAAAAIB+z8BAAAAHgAAAAAAAADcp0DIwEIQGrS5CAArL+GCAQAA
AAAAAAAuAAAAAwD9P+QEAAADABlAAAAAAAMAGkAAAAAAAwAdQAAAAAADAB5AAAAAAB4AMEABAAAA
DAAAAEpESjQ3MzQzNTIyAB4AMUABAAAADAAAAEpESjQ3MzQzNTIyAB4AMkABAAAAMgAAAG9wZW5l
bWJlZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcAAAAeADNAAQAAABcA
AABqYW1lcy5yb25hbGRAZ21haWwuY29tAAAeADhAAQAAAAwAAABKREo0NzM0MzUyMgAeADlAAQAA
AAIAAAAuAAAAAwB2QP////8LACkAAAAAAAsAIwAAAAAAAwAGEBAE3+0DAAcQXA4AAAMAEBAAAAAA
AwAREAAAAAAeAAgQAQAAAGUAAABUSEFURklYRVNJVElGUkVMRVZBTlQ6T1JHT1BFTkVNQkVEREVE
L0NPTkYvU0FOSVRZQ09ORk5FRURTVE9CRVBBVENIRUQ/LUJCTUlOVkVSU0lPTj0iMTgxOCIrQkJN
SU5WRVJTAAAAAAIBfwABAAAAPQAAADwzRjdGOEFDNEM3QTBBMDQyQTJGRTQwNzIwQjc1RTIwOEYw
MzIxRkBudnMwMDg2Lm5lZGFwLmxvY2FsPgAAAAC8MQ==

------_=_NextPart_001_01CB781B.C4874F43--

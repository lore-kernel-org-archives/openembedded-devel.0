Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8tfF-0001iV-4n
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 11:46:04 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8tdy-0000IE-S3 for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 05:44:43 -0500
Date: Fri, 13 Nov 2009 05:44:38 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258106721.5799.3.camel@dax.rpnet.com>
Message-ID: <alpine.LFD.2.00.0911130540240.3232@localhost>
References: <alpine.LFD.2.00.0911130447260.1157@localhost>
	<1258106721.5799.3.camel@dax.rpnet.com>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build breakage: sqlite3_3.6.20
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
X-List-Received-Date: Fri, 13 Nov 2009 10:46:04 -0000
X-Groupsio-MsgNum: 14258
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1151852693-1258109079=:3232"

--8323328-1151852693-1258109079=:3232
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 13 Nov 2009, Richard Purdie wrote:

> On Fri, 2009-11-13 at 04:49 -0500, Robert P. J. Day wrote:
> > NOTE: make -j4 sqlite3.h
> > make: `sqlite3.h' is up to date.
> > NOTE: make -j4
> > rm -rf tsrc
> > mkdir -p tsrc
> > cp ./src/alter.c ./src/analyze.c ./src/attach.c ./src/auth.c ./src/back=
up.c ./src/bitvec.c ./src/btmutex.c ./src/btree.c ./src/btree.h ./src/btree=
Int.h ./src/build.c ./src/callback.c ./src/complete.c ./src/date.c ./src/de=
lete.c ./src/expr.c ./src/fault.c ./src/fkey.c ./src/func.c ./src/global.c =
=2E/src/hash.c ./src/hash.h ./src/hwtime.h ./src/insert.c ./src/journal.c .=
/src/legacy.c ./src/loadext.c ./src/main.c ./src/malloc.c ./src/mem0.c ./sr=
c/mem1.c ./src/mem2.c ./src/mem3.c ./src/mem5.c ./src/memjournal.c ./src/mu=
tex.c ./src/mutex.h ./src/mutex_noop.c ./src/mutex_os2.c ./src/mutex_unix.c=
 ./src/mutex_w32.c ./src/notify.c ./src/os.c ./src/os.h ./src/os_common.h .=
/src/os_os2.c ./src/os_unix.c ./src/os_win.c ./src/pager.c ./src/pager.h ./=
src/parse.y ./src/pcache.c ./src/pcache.h ./src/pcache1.c ./src/pragma.c ./=
src/prepare.c ./src/printf.c ./src/random.c ./src/resolve.c ./src/rowset.c =
=2E/src/select.c ./src/status.c ./src/shell.c ./src/sqlite.h.in ./src/sqlit=
e3ext.h ./src/sqliteInt.h ./src/sqliteLimit.h ./src/table.c ./src/tclsqlite=
=2Ec ./src/tokenize.c ./src/trigger.c ./src/utf.c ./src/update.c ./src/util=
=2Ec ./src/vacuum.c ./src/vdbe.c ./src/vdbe.h ./src/vdbeapi.c ./src/vdbeaux=
=2Ec ./src/vdbeblob.c ./src/vdbemem.c ./src/vdbeInt.h ./src/vtab.c ./src/wa=
lker.c ./src/where.c keywordhash.h opcodes.c opcodes.h parse.c parse.h conf=
ig.h sqlite3.h ./ext/fts1/fts1.c ./ext/fts1/fts1.h ./ext/fts1/fts1_hash.c .=
/ext/fts1/fts1_hash.h ./ext/fts1/fts1_porter.c ./ext/fts1/fts1_tokenizer.h =
=2E/ext/fts1/fts1_tokenizer1.c ./ext/fts2/fts2.c ./ext/fts2/fts2.h ./ext/ft=
s2/fts2_hash.c ./ext/fts2/fts2_hash.h ./ext/fts2/fts2_icu.c ./ext/fts2/fts2=
_porter.c ./ext/fts2/fts2_tokenizer.h ./ext/fts2/fts2_tokenizer.c ./ext/fts=
2/fts2_tokenizer1.c ./ext/fts3/fts3.c ./ext/fts3/fts3.h ./ext/fts3/fts3_exp=
r.c ./ext/fts3/fts3_expr.h ./ext/fts3/fts3_hash.c ./ext/fts3/fts3_hash.h ./=
ext/fts3/fts3_icu.c ./ext/fts3/fts3_porter.c ./ext/fts3/fts3_tokenizer.h ./=
ext/fts3/fts3_tokenizer.c ./ext/fts3/fts3_tokenizer1.c ./ext/icu/sqliteicu.=
h ./ext/icu/icu.c ./ext/rtree/rtree.h ./ext/rtree/rtree.c tsrc
> > rm tsrc/sqlite.h.in tsrc/parse.y
> > tclsh8.4 ./tool/vdbe-compress.tcl <tsrc/vdbe.c >vdbe.new
> > tclsh8.4: error while loading shared libraries: libtcl8.4.so.0: cannot =
open shared object file: No such file or directory
> > make: *** [.target_source] Error 127
> > FATAL: oe_runmake failed
>
> Can you do a "find -name *tcl*" on your tmp/staging directory
> please?

  assuming you really want to see if there's a built libtcl, i just
looked for "*libtcl*" (a full "*tcl*" search is attached):

$ find staging -name "*libtcl*"
staging/x86_64-linux/usr/lib/libtclstub8.4.a
staging/x86_64-linux/usr/lib/libtcl8.4.so
staging/armv7a-angstrom-linux-gnueabi/usr/lib/libtclstub8.4.a
staging/armv7a-angstrom-linux-gnueabi/usr/lib/libtcl8.4.so
staging/armv7a-angstrom-linux-gnueabi/usr/lib/libtcl8.4.so.0
$

$ ls -l staging/armv7a-angstrom-linux-gnueabi/usr/lib/libtcl8.4.so*
lrwxrwxrwx. 1 rpjday rpjday      14 2009-11-12 13:03 staging/armv7a-angstro=
m-linux-gnueabi/usr/lib/libtcl8.4.so -> libtcl8.4.so.0
-rwxr-xr-x. 1 rpjday rpjday 8241813 2009-11-12 13:03 staging/armv7a-angstro=
m-linux-gnueabi/usr/lib/libtcl8.4.so.0
$

> FWIW this builds here (as does python native). I've seen one other
> report about the python-native segfault from Philip Balister.

  i've occasionally had segfaults that went away with another build
attempt.  this one, though, has been reliably reproducible.

rday
--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323328-1151852693-1258109079=:3232
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=tcl
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LFD.2.00.0911130544380.3232@localhost>
Content-Description: 
Content-Disposition: attachment; filename=tcl

Li94ODZfNjQtbGludXgvdXNyL2luY2x1ZGUvdGNsRGVjbHMuaA0KLi94ODZfNjQtbGludXgvdXNy
L2luY2x1ZGUvdGNsLmgNCi4veDg2XzY0LWxpbnV4L3Vzci9pbmNsdWRlL3RjbFBsYXREZWNscy5o
DQouL3g4Nl82NC1saW51eC91c3IvaW5jbHVkZS90Y2w4LjQuMTkNCi4veDg2XzY0LWxpbnV4L3Vz
ci9pbmNsdWRlL3RjbDguNC4xOS9jb21wYXQvdGNsRXJybm8uaA0KLi94ODZfNjQtbGludXgvdXNy
L2luY2x1ZGUvdGNsOC40LjE5L3VuaXgvdGNsVW5peFRocmQuaA0KLi94ODZfNjQtbGludXgvdXNy
L2luY2x1ZGUvdGNsOC40LjE5L3VuaXgvdGNsVW5peFBvcnQuaA0KLi94ODZfNjQtbGludXgvdXNy
L2luY2x1ZGUvdGNsOC40LjE5L2dlbmVyaWMvdGNsUmVnZXhwLmgNCi4veDg2XzY0LWxpbnV4L3Vz
ci9pbmNsdWRlL3RjbDguNC4xOS9nZW5lcmljL3RjbERlY2xzLmgNCi4veDg2XzY0LWxpbnV4L3Vz
ci9pbmNsdWRlL3RjbDguNC4xOS9nZW5lcmljL3RjbEludFBsYXREZWNscy5oDQouL3g4Nl82NC1s
aW51eC91c3IvaW5jbHVkZS90Y2w4LjQuMTkvZ2VuZXJpYy90Y2wuaA0KLi94ODZfNjQtbGludXgv
dXNyL2luY2x1ZGUvdGNsOC40LjE5L2dlbmVyaWMvdGNsSW50RGVjbHMuaA0KLi94ODZfNjQtbGlu
dXgvdXNyL2luY2x1ZGUvdGNsOC40LjE5L2dlbmVyaWMvdGNsQ29tcGlsZS5oDQouL3g4Nl82NC1s
aW51eC91c3IvaW5jbHVkZS90Y2w4LjQuMTkvZ2VuZXJpYy90Y2xQbGF0RGVjbHMuaA0KLi94ODZf
NjQtbGludXgvdXNyL2luY2x1ZGUvdGNsOC40LjE5L2dlbmVyaWMvdGNsSW5pdFNjcmlwdC5oDQou
L3g4Nl82NC1saW51eC91c3IvaW5jbHVkZS90Y2w4LjQuMTkvZ2VuZXJpYy90Y2xQb3J0LmgNCi4v
eDg2XzY0LWxpbnV4L3Vzci9pbmNsdWRlL3RjbDguNC4xOS9nZW5lcmljL3RjbEludC5oDQouL3g4
Nl82NC1saW51eC91c3IvaW5jbHVkZS90Y2w4LjQuMTkvZ2VuZXJpYy90Y2xJTy5oDQouL3g4Nl82
NC1saW51eC91c3IvaW5jbHVkZS90Y2w4LjQuMTkvZ2VuZXJpYy90Y2xNYXRoLmgNCi4veDg2XzY0
LWxpbnV4L3Vzci9pbmNsdWRlL2dsaWItMi4wL2dpby9nc29ja2V0Y2xpZW50LmgNCi4veDg2XzY0
LWxpbnV4L3Vzci9iaW4vYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdGNsQ29uZmlnLnNo
DQouL3g4Nl82NC1saW51eC91c3IvYmluL3RjbHNoDQouL3g4Nl82NC1saW51eC91c3IvYmluL3Rj
bENvbmZpZy5zaA0KLi94ODZfNjQtbGludXgvdXNyL2Jpbi90Y2xzaDguNA0KLi94ODZfNjQtbGlu
dXgvdXNyL2xpYi9saWJ0Y2xzdHViOC40LmENCi4veDg2XzY0LWxpbnV4L3Vzci9saWIvbGlidGNs
OC40LnNvDQouL3g4Nl82NC1saW51eC91c3Ivc2hhcmUvZ2V0dGV4dC9tc2d1bmZtdC50Y2wNCi4v
eDg2XzY0LWxpbnV4L3Vzci9zaGFyZS9kb2MvZ2V0dGV4dC9leGFtcGxlcy9oZWxsby10Y2wtdGsN
Ci4veDg2XzY0LWxpbnV4L3Vzci9zaGFyZS9kb2MvZ2V0dGV4dC9leGFtcGxlcy9oZWxsby10Y2wt
dGsvaGVsbG8udGNsDQouL3g4Nl82NC1saW51eC91c3Ivc2hhcmUvZG9jL2dldHRleHQvZXhhbXBs
ZXMvaGVsbG8tdGNsDQouL3g4Nl82NC1saW51eC91c3Ivc2hhcmUvZG9jL2dldHRleHQvZXhhbXBs
ZXMvaGVsbG8tdGNsL2hlbGxvLnRjbA0KLi9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS9z
aGxpYnMvdGNsLWxpYi52ZXINCi4vYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvc2hsaWJz
L3RjbC1saWIubGlzdA0KLi9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS91c3IvaW5jbHVk
ZS90Y2xEZWNscy5oDQouL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9pbmNsdWRl
L3RjbC5oDQouL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9pbmNsdWRlL3RjbFBs
YXREZWNscy5oDQouL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9pbmNsdWRlL3Rj
bDguNC4xOQ0KLi9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS91c3IvaW5jbHVkZS90Y2w4
LjQuMTkvY29tcGF0L3RjbEVycm5vLmgNCi4vYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkv
dXNyL2luY2x1ZGUvdGNsOC40LjE5L3VuaXgvdGNsVW5peFRocmQuaA0KLi9hcm12N2EtYW5nc3Ry
b20tbGludXgtZ251ZWFiaS91c3IvaW5jbHVkZS90Y2w4LjQuMTkvdW5peC90Y2xVbml4UG9ydC5o
DQouL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9pbmNsdWRlL3RjbDguNC4xOS9n
ZW5lcmljL3RjbFJlZ2V4cC5oDQouL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9p
bmNsdWRlL3RjbDguNC4xOS9nZW5lcmljL3RjbERlY2xzLmgNCi4vYXJtdjdhLWFuZ3N0cm9tLWxp
bnV4LWdudWVhYmkvdXNyL2luY2x1ZGUvdGNsOC40LjE5L2dlbmVyaWMvdGNsSW50UGxhdERlY2xz
LmgNCi4vYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL2luY2x1ZGUvdGNsOC40LjE5
L2dlbmVyaWMvdGNsLmgNCi4vYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL2luY2x1
ZGUvdGNsOC40LjE5L2dlbmVyaWMvdGNsSW50RGVjbHMuaA0KLi9hcm12N2EtYW5nc3Ryb20tbGlu
dXgtZ251ZWFiaS91c3IvaW5jbHVkZS90Y2w4LjQuMTkvZ2VuZXJpYy90Y2xDb21waWxlLmgNCi4v
YXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL2luY2x1ZGUvdGNsOC40LjE5L2dlbmVy
aWMvdGNsUGxhdERlY2xzLmgNCi4vYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL2lu
Y2x1ZGUvdGNsOC40LjE5L2dlbmVyaWMvdGNsSW5pdFNjcmlwdC5oDQouL2FybXY3YS1hbmdzdHJv
bS1saW51eC1nbnVlYWJpL3Vzci9pbmNsdWRlL3RjbDguNC4xOS9nZW5lcmljL3RjbFBvcnQuaA0K
Li9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS91c3IvaW5jbHVkZS90Y2w4LjQuMTkvZ2Vu
ZXJpYy90Y2xJbnQuaA0KLi9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS91c3IvaW5jbHVk
ZS90Y2w4LjQuMTkvZ2VuZXJpYy90Y2xJTy5oDQouL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVl
YWJpL3Vzci9pbmNsdWRlL3RjbDguNC4xOS9nZW5lcmljL3RjbE1hdGguaA0KLi9hcm12N2EtYW5n
c3Ryb20tbGludXgtZ251ZWFiaS91c3IvaW5jbHVkZS9nc3RyZWFtZXItMC4xMC9nc3QvZ3N0Y2xv
Y2suaA0KLi9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS91c3IvaW5jbHVkZS9nc3RyZWFt
ZXItMC4xMC9nc3QvbmV0L2dzdG5ldGNsaWVudGNsb2NrLmgNCi4vYXJtdjdhLWFuZ3N0cm9tLWxp
bnV4LWdudWVhYmkvdXNyL2luY2x1ZGUvZ2xpYi0yLjAvZ2lvL2dzb2NrZXRjbGllbnQuaA0KLi9h
cm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS91c3IvaW5jbHVkZS9qYWNrL2ludGNsaWVudC5o
DQouL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9saWIvbGlidGNsc3R1YjguNC5h
DQouL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9saWIvbGlidGNsOC40LnNvDQou
L2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9saWIvbGlidGNsOC40LnNvLjANCi4v
YXJtdjdhLWFuZ3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL3NoYXJlL2phY2stYXVkaW8tY29ubmVj
dGlvbi1raXQvcmVmZXJlbmNlL2h0bWwvaW50Y2xpZW50XzhoX3NvdXJjZS5odG1sDQouL2FybXY3
YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9zaGFyZS9qYWNrLWF1ZGlvLWNvbm5lY3Rpb24t
a2l0L3JlZmVyZW5jZS9odG1sL2ludGNsaWVudF84aC5odG1sDQouL2FybXY3YS1hbmdzdHJvbS1s
aW51eC1nbnVlYWJpL3Vzci9zaGFyZS9qYWNrLWF1ZGlvLWNvbm5lY3Rpb24ta2l0L3JlZmVyZW5j
ZS9odG1sL2ludGNsaWVudF84aC1zb3VyY2UuaHRtbA0KLi9hcm12N2EtYW5nc3Ryb20tbGludXgt
Z251ZWFiaS91c3Ivc2hhcmUvdmltL3ZpbTcwL2NvbXBpbGVyL3RjbC52aW0NCi4vYXJtdjdhLWFu
Z3N0cm9tLWxpbnV4LWdudWVhYmkvdXNyL3NoYXJlL3ZpbS92aW03MC9pbmRlbnQvdGNsLnZpbQ0K
Li9hcm12N2EtYW5nc3Ryb20tbGludXgtZ251ZWFiaS91c3Ivc2hhcmUvdmltL3ZpbTcwL3N5bnRh
eC90Y2wudmltDQouL2FybXY3YS1hbmdzdHJvbS1saW51eC1nbnVlYWJpL3Vzci9zaGFyZS92aW0v
dmltNzAvZG9jL2lmX3RjbC50eHQNCi4vYmVhZ2xlYm9hcmQtYW5nc3Ryb20tbGludXgtZ251ZWFi
aS9rZXJuZWwvYXJjaC9hcm0vbGliL3Rlc3RjbGVhcmJpdC5vDQouL2JlYWdsZWJvYXJkLWFuZ3N0
cm9tLWxpbnV4LWdudWVhYmkva2VybmVsL2FyY2gvYXJtL2xpYi90ZXN0Y2xlYXJiaXQuUw0KLi9i
ZWFnbGVib2FyZC1hbmdzdHJvbS1saW51eC1nbnVlYWJpL2tlcm5lbC9hcmNoL2FybS9saWIvLnRl
c3RjbGVhcmJpdC5vLmNtZA0K

--8323328-1151852693-1258109079=:3232--

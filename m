Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N8ww9-0006NG-Vf
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 15:15:45 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nADEBGpL013894 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 14:11:16 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BfjwSNkOXLoa
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 14:11:16 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nADEBB92013852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 14:11:13 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.0911130702580.16806@localhost>
References: <alpine.LFD.2.00.0911130447260.1157@localhost>
	<1258106998.5799.7.camel@dax.rpnet.com>
	<alpine.LFD.2.00.0911130702580.16806@localhost>
Date: Fri, 13 Nov 2009 14:09:33 +0000
Message-Id: <1258121373.5799.64.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
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
X-List-Received-Date: Fri, 13 Nov 2009 14:15:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-11-13 at 07:04 -0500, Robert P. J. Day wrote:
> On Fri, 13 Nov 2009, Richard Purdie wrote:
>=20
> > On Fri, 2009-11-13 at 04:49 -0500, Robert P. J. Day wrote:
> > > NOTE: make -j4 sqlite3.h
> > > make: `sqlite3.h' is up to date.
> > > NOTE: make -j4
> > > rm -rf tsrc
> > > mkdir -p tsrc
> > > cp ./src/alter.c ./src/analyze.c ./src/attach.c ./src/auth.c ./src/ba=
ckup.c ./src/bitvec.c ./src/btmutex.c ./src/btree.c ./src/btree.h ./src/btr=
eeInt.h ./src/build.c ./src/callback.c ./src/complete.c ./src/date.c ./src/=
delete.c ./src/expr.c ./src/fault.c ./src/fkey.c ./src/func.c ./src/global.=
c ./src/hash.c ./src/hash.h ./src/hwtime.h ./src/insert.c ./src/journal.c .=
/src/legacy.c ./src/loadext.c ./src/main.c ./src/malloc.c ./src/mem0.c ./sr=
c/mem1.c ./src/mem2.c ./src/mem3.c ./src/mem5.c ./src/memjournal.c ./src/mu=
tex.c ./src/mutex.h ./src/mutex_noop.c ./src/mutex_os2.c ./src/mutex_unix.c=
 ./src/mutex_w32.c ./src/notify.c ./src/os.c ./src/os.h ./src/os_common.h .=
/src/os_os2.c ./src/os_unix.c ./src/os_win.c ./src/pager.c ./src/pager.h ./=
src/parse.y ./src/pcache.c ./src/pcache.h ./src/pcache1.c ./src/pragma.c ./=
src/prepare.c ./src/printf.c ./src/random.c ./src/resolve.c ./src/rowset.c =
./src/select.c ./src/status.c ./src/shell.c ./src/sqlite.h.in ./src/sqlite3=
ext.h ./src/sqliteInt.h ./src/sqliteLimit.h ./src/table.c ./src/tclsqlite.c=
 ./src/tokenize.c ./src/trigger.c ./src/utf.c ./src/update.c ./src/util.c .=
/src/vacuum.c ./src/vdbe.c ./src/vdbe.h ./src/vdbeapi.c ./src/vdbeaux.c ./s=
rc/vdbeblob.c ./src/vdbemem.c ./src/vdbeInt.h ./src/vtab.c ./src/walker.c .=
/src/where.c keywordhash.h opcodes.c opcodes.h parse.c parse.h config.h sql=
ite3.h ./ext/fts1/fts1.c ./ext/fts1/fts1.h ./ext/fts1/fts1_hash.c ./ext/fts=
1/fts1_hash.h ./ext/fts1/fts1_porter.c ./ext/fts1/fts1_tokenizer.h ./ext/ft=
s1/fts1_tokenizer1.c ./ext/fts2/fts2.c ./ext/fts2/fts2.h ./ext/fts2/fts2_ha=
sh.c ./ext/fts2/fts2_hash.h ./ext/fts2/fts2_icu.c ./ext/fts2/fts2_porter.c =
./ext/fts2/fts2_tokenizer.h ./ext/fts2/fts2_tokenizer.c ./ext/fts2/fts2_tok=
enizer1.c ./ext/fts3/fts3.c ./ext/fts3/fts3.h ./ext/fts3/fts3_expr.c ./ext/=
fts3/fts3_expr.h ./ext/fts3/fts3_hash.c ./ext/fts3/fts3_hash.h ./ext/fts3/f=
ts3_icu.c ./ext/fts3/fts3_porter.c ./ext/fts3/fts3_tokenizer.h ./ext/fts3/f=
ts3_tokenizer.c ./ext/fts3/fts3_tokenizer1.c ./ext/icu/sqliteicu.h ./ext/ic=
u/icu.c ./ext/rtree/rtree.h ./ext/rtree/rtree.c tsrc
> > > rm tsrc/sqlite.h.in tsrc/parse.y
> > > tclsh8.4 ./tool/vdbe-compress.tcl <tsrc/vdbe.c >vdbe.new
> > > tclsh8.4: error while loading shared libraries: libtcl8.4.so.0: canno=
t open shared object file: No such file or directory
> > > make: *** [.target_source] Error 127
> > > FATAL: oe_runmake failed
> >
> > There is talk on irc of the symbolic link for libtcl8.4.so.0 not being
> > created. This should be done in the tcl-native recipe by the
> > oe_libinstall shell function call.
> >
> > We're going to need someone who is experiencing this problem to find ou=
t
> > why that function is not creating the symlink...
> >
> > (assuming the symlink is missing)
>=20
>   i reran that build verbosely and with debugging, and posted it:
>=20
> http://pastebin.com/d2fbcdbb

Phil Blundell pushed a fix for tcl-native, could you see if that helps?

Cheers,

Richard



